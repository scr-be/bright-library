#!/bin/bash

##
## This file is part of the `src-run/bright-library` package.
##
## (c) Rob Frawley 2nd <rmf@src.run>
##
## For the full copyright and license information, view the LICENSE.md
## file distributed with this source code.
##


#
# A simple output writer implementation that abstracts calls to printf. If no
# arguments are passed, nothing is output whatsoever. The first argument can
# either be the compiled string to output in its entirety, or a format string
# following the printf standard. Any additional arguments are passed to printf
# as replacement values. Due to how printf is called, format strings can begin
# with a dash ("-") or other restricted chars without the call erroring.
#

function _bright_out_compile()
{
    local format="${1}"
    shift

    if [[ -n "${format}" ]]; then
        printf -- "${format}" "${@}" 2> /dev/null
    fi
}


#
# Outputs a newline automatically when global configuration is set to do so,
# otherwise this method performs no actions.
#

function _bright_auto_newline()
{
    [[ ${_BRIGHT_AUTO_NEWLINES} -eq 1 ]] && _bright_out_compile '\n'
}


#
# The generic internal error function outputs a compiled error message string,
# with its first parameter being the error context (generally the name of the
# function where the error originated), and its second parameter being the
# error message string.
#
# Arguments after the second are "extra information" and output after the
# message using the format: Contextually relevant argument(s): "a", [...], "z".
# These extra arguments can also act as configuration values when prefixed by
# a supported value: "return:[0-9]" enabled configuring the return integer;
# and "extras:.+" enabled customizing the message shown before the extra values.
#

function _bright_error_generic()
{
    local context="${1:-undefined-function}"
    local message="${2:-unspecified error state}"
    local time="$(date +%s.%N | grep -o -E '[0-9]{3}\.[0-9]{4}')"
    local code=255
    local type="contextually relevant argument(s)"
    local args
    shift
    shift

    while [[ $# -gt 0 ]]; do
        if [[ "${1:0:7}" == "return:" ]]; then
            code="${1:7}"
            shift && continue || break
        fi

        if [[ "${1:0:7}" == "extras:" ]]; then
            type="${1:7}"
            shift && continue || break
        fi

        args+="$(printf '"%s", ' "${1}")"
        shift && continue || break
    done

    if [[ ${_BRIGHT_HIDE_ERRORS} -ne 1 ]]; then
        >&2 _bright_out_compile 'ERROR [ %s | %s() ] %s.' \
            "${time}" \
            "${context}" \
            "${message^}"

        if [[ -n "${args}" ]]; then
            >&2 _bright_out_compile ' %s: %s.' \
                "${type^}" \
                "${args:0:-2}"
        fi

        >&2 _bright_out_compile '\n'
    fi

    return ${code}
}


#
# The internal error function customized for "invalid assignments", such as
# failures in assigning values or intentionally failing to assign values due
# to a state issue detected prior. See the "_bright_error_generic" usage
# description for argument information.
#

function _bright_error_invalid_assignment()
{
    _bright_error_generic "${@}" 'extras:failed assignment(s)'

    return $?
}


#
# The internal error function customized for "invalid ranges", such as
# integers that are out of bounds of the expected value. See the
# "_bright_error_generic" usage description for argument information.
#

function _bright_error_invalid_range()
{
    _bright_error_generic "${@}" 'extras:out of range argument(s)'

    return $?
}


#
# Handles assignment of special variable "IFS" while saving its prior state for
# restoration at a later time. The only argument is the new value intended for
# assignment to $IFS. This method cannot be called more than once without first
# restoring the value of $IFS using the "_bright_ifs_restore" function.
#

function _bright_ifs_assign()
{
    local ifs_value="${1:-}"

    if [[ -n "${ifs_prior}" ]]; then
        _bright_error_invalid_assignment \
            "${FUNCNAME}" \
            'cannot reassign ifs prior to restoration of prior assignment; first restore using "_bright_ifs_restore"' \
            "${ifs_value}"
        exit $?
    fi

    local -g ifs_prior="${IFS}"
    IFS="${ifs_value}"
}


#
# Handles restoration of the special "IFS" variable using its previous value,
# as saved from calling "_bright_ifs_assign". This method cannot be called more
# than once without first assigning the value of $IFS using the
# "_bright_ifs_assign" function.
#

function _bright_ifs_restore()
{
    if [[ -z "${ifs_prior}" ]]; then
        _bright_error_invalid_assignment \
            "${FUNCNAME}" \
            'cannot restore ifs with no prior assignment saved; first assign using "_bright_ifs_assign"'
        exit $?
    fi

    IFS="${ifs_prior}"
    unset ifs_prior
}


#
# Attempts to determine the value of the requested key for the given array. The
# first argument is the name of the array, and the second argument is the key
# to lookup within said array.
#

function _bright_map_resolver()
{
    local -n map="${1}"
    local    key="${2:-}"

    if [[ -n "${key}" ]] && [[ ${map[$key]+_} ]]; then
        _bright_out_compile "${map[$key]}" && return
    fi

    _bright_error_invalid_range \
        "${FUNCNAME}" \
        'the provided map key is invalid; it is outside of the acceptable range or does not exist' \
        "${key}"
    return $?
}


#
# Locates and returns the control value
# returns the control value for the passed style type
#

function _bright_control_style()
{
    local    style_name="$1"
    local -A style_maps=(
        [bold]=1
        [bright]=1
        [dim]=2
        [underline]=4
        [blink]=5
        [reverse]=7
        [hidden]=8
    )

    _bright_map_resolver 'style_maps' "${style_name}"
    return $?
}

#
# returns the control value for the passed style type
#
function _bright_control_reset()
{
    local    style_name="${1:-all}"
    local -A style_maps=(
        [all]=0
        [bold]=21
        [bright]=21
        [dim]=22
        [underline]=24
        [blink]=25
        [reverse]=27
        [hidden]=28
    )

    _bright_map_resolver style_maps "$style_name"
    return $?
}

#
# returns the control value for the passed foreground color
#
function _bright_control_fg()
{
    local    color_name="$1"
    local -A color_maps=(
        [default]=39
        [black]=30
        [red]=31
        [green]=32
        [yellow]=33
        [blue]=34
        [magenta]=35
        [cyan]=36
        [white]=37
        [light-black]=90
        [light-red]=91
        [light-green]=92
        [light-yellow]=93
        [light-blue]=94
        [light-magenta]=95
        [light-cyan]=96
        [light-white]=97
    )

    _bright_map_resolver color_maps "$color_name"

    return $?
}

#
# returns the control value for the passed background color
#
function _bright_control_bg()
{
    local    color_name="$1"
    local -A color_maps=(
        [default]=49
        [black]=40
        [red]=41
        [green]=42
        [yellow]=43
        [blue]=44
        [magenta]=45
        [cyan]=46
        [white]=47
        [light-black]=100
        [light-red]=101
        [light-green]=102
        [light-yellow]=103
        [light-blue]=104
        [light-magenta]=105
        [light-cyan]=106
        [light-white]=107
    )

    _bright_map_resolver color_maps "$color_name"

    return $?
}

#
# trim whitespace from beginning and end of string
#
function _bright_str_trim()
{
    echo $(echo $1 | sed -e 's/^[ \t]*//')
}

function _bright_ifs_assign()
{
    local ifs_value="${1:-}"

    if [[ -z "${ifs_prior}" ]]; then
        local -g ifs_prior="${IFS}"
        IFS="${ifs_value}"
    else
        _bright_error_generic ${FUNCNAME} "expected range 0 through 107" "${ret}" \
                || return $?
    fi
}

function _bright_ifs_restore()
{
    if [[ -n "${ifs_prior}" ]]; then
        IFS="${ifs_prior}"
        unset ifs_prior
    fi
}

#
# build the output string based on the passed control commands
#
function _bright_str_builder_return()
{
    local    str="${1:-}"
    shift
    local    all="${@}"
    local    ctl=""
    local    cmd=""
    local    ret=""
    local -a ctl_codes=()

    until [ -z "${1}" ]; do
        IFS=\: read -a ctl_part <<< "$(_bright_str_trim ${1})"

        cmd="_bright_control_${ctl_part[0]}"
        ret="$(${cmd} "${ctl_part[1]}")"

        if ! [ ${ret} -ge 0 -a ${ret} -le 108 ]; then
            _bright_error_generic ${FUNCNAME} "expected range 0 through 107" "${ret}" \
                || return $?
        else
            ctl_codes+=("${ret}")
        fi

        shift || break
    done

    if [[ ${#ctl_codes[@]} -eq 0 ]]; then
        echo "$str"
    fi

    ctl=""
    for c in ${ctl_codes[@]}; do
        ctl="${ctl};${c}"
    done

    echo -n "\e[${ctl:1}m${str}"
    return $?
}

#
# build the output control sequence based on the passed control commands and output it
#
function _bright_str_builder_assign()
{
    echo -en "$(_bright_str_builder_return "" $1)"
    return $?
}

#
# build the output string based on the passed control commands and output it
#
function _bright_str_builder_output()
{
    echo -en "$(_bright_str_builder_return "$1" $2)"

    if [[ $_BRIGHT_AUTO_RESETS -eq 1 ]]; then
        echo -en "\e[$(_bright_control_reset all)m"
    fi

    return $?
}
