#!/bin/bash

##
## This file is part of the `src-run/bright-library` package.
##
## (c) Rob Frawley 2nd <rmf@src.run>
##
## For the full copyright and license information, view the LICENSE.md
## file distributed with this source code.
##

# SC2059: Usage of variables in the printf format string.
# shellcheck disable=SC2059


#
# Returns the status exit code of the last-run piped command. If no prior status
# is available, a success status code of 0 is returned.
#

function _return_pipe_stat_code() {
    return "${PIPESTATUS[0]=0}"
}


#
# Outputs the status exit code of the last-run piped command. If no prior status
# is available, a success status code of 0 is returned.
#

function _output_pipe_stat_code() {
    _return_pipe_stat_code
    _out_format "${?}"
}


#
# Repeats the string passed as the first argument any number of time, as passed
# by the optional second argument. If no second argument is present, the string
# is only output once (and is therefore not repeated).
#

function _str_repeat() {
    local value="${1}"
    local count=${2:-1}

    for ((n=0; n<count; n++)); do
        printf -- "%s" "${value}"
    done
}


#
# Direct abstraction for regular printf function, accepting the same arguments
# as defined for printf. No call to print is made if argument count is 0. Does
# not intentionally interpret backslash escape sequences.
#

function _out_format() {
    if [[ ${#} -gt 1 ]] && [[ ${1} = *%* ]]; then
        printf -- "${@}"
    elif [[ ${#} -gt 0 ]]; then
        printf -- "$(_str_repeat "%s" ${#})" "${@}"
    fi
}


#
# Accepts the same arguments as _out_format and behaves exactly the same with
# the following singular difference: the compiled string is passed to echo for
# backslash escape sequence interpreting.
#

function _out_interp() {
    [[ ${#} -gt 0 ]] \
        && echo -en "$(_out_format "${@}")"
}


#
# Accepts the same arguments as _out_format and behaves exactly the same with
# the following singular difference: the compiled string is redirected from
# the STDOUT file descriptor to the STDERR file descriptor instead.
#

function _out_stderr() {
    [[ ${#} -gt 0 ]] \
        && >&2 _out_interp "${@}"
}


#
# Outputs a newline automatically when global configuration is set to do so,
# otherwise this method performs no actions.
#

function _auto_nl() {
    [[ ${_BRIGHT_AUTO_NEWLINES} -eq 1 ]] \
        && _out_format '\n'
}


#
# Outputs a newline automatically when global configuration is set to do so,
# otherwise this method performs no actions.
#

function _auto_reset() {
    [[ ${_BRIGHT_AUTO_RESET} -eq 1 ]] \
        && _ansi_control_seq '' "$(_control_reset all)"
}


#
# Outputs the current unixtime with nanoseconds, returned as a float.
#

function _get_time_nano() {
    date +%s.%N 2> /dev/null
}


#
# Outputs a kind-of-time representation, where the full value from _get_time_nano
# is shortened such that there are only three digits before and four digits
# after the decimal point.
#

function _get_time_kind() {
    _get_time_nano | grep -o -E '[0-9]{3}\.[0-9]{4}' 2> /dev/null
}


#
# Takes the error's function name back-trace and reverses it so that the most-
# relevant function name is on the right side. Additionally, parenthesis are
# added to the function names, as well as arrows shows the function call direction.
#

function _error_func_format() {
    local func="${1}"
    local text

    for f in ${func}; do
        [[ "${f}" != "main" ]] && text="${f}${text:+ }${text:-}"
    done

    sed 's/ /() -> /g' 2> /dev/null <<< "${text}"
}


#
# Takes the error's extra arguments and adds commas between the items.
#

function _error_args_format() {
    local args="${1}"

    sed 's/ /, /g' 2> /dev/null <<< "${args}"
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

function _error_generic() {
    local func="${1:-undefined-function}"
    local text="${2:-unspecified error state}"
    local type='contextually relevant argument'
    local code=255
    local -a args
    shift
    shift

    while [[ ${#} -gt 0 ]]; do
        if [[ "${1:0:7}" == "return:" ]]; then
            code="${1:7}"
            shift || break
        elif [[ "${1:0:7}" == "extras:" ]]; then
            type="${1:7}"
            shift || break
        else
            args+=("$(printf '"%s"' "${1}")")
            shift || break
        fi
    done

    [[ ${#args[@]} -gt 1 ]] && type+='(s)'

    if [[ "${_BRIGHT_HIDE_ERRORS}" -ne 1 ]]; then
        _out_stderr 'ERROR [ %s | %s() ] %s.' \
            "$(_get_time_kind)" \
            "$(_error_func_format "${func}")" \
            "${text^}"

        if [[ ${#args[@]} -gt 0 ]]; then
            _out_stderr ' %s: %s.' \
                "${type^}" \
                "$(_error_args_format "${args[*]}")"
        fi

        _out_stderr '\n'
    fi

    return "${code}"
}


#
# The internal error function customized for "invalid assignments", such as
# failures in assigning values or intentionally failing to assign values due
# to a state issue detected prior. See the "_error_generic" usage
# description for argument information.
#

function _error_invalid_assignment() {
    _error_generic \
        "${@}" \
        'extras:failed assignment'

    return "${?}"
}


#
# The internal error function customized for "invalid ranges", such as
# integers that are out of bounds of the expected value. See the
# "_error_generic" usage description for argument information.
#

function _error_invalid_range() {
    _error_generic \
        "${@}" \
        'extras:out of range argument'

    return "${?}"
}


#
# The internal error function customized for "undefined" functions. The message
# is predefined and only the function name and extra arguments can be passed.
#

function _error_invalid_type() {
    _error_generic \
        "${1}" \
        "encountered an unmet ${2} type expectation" \
        'extras:Invalid typed item' \
        "${@:3}"

    return "${?}"
}


#
# The internal error function customized for "undefined" functions. The message
# is predefined and only the function name and extra arguments can be passed.
#

function _error_non_zero_func() {
    _error_generic \
        "${1}" \
        'encountered a non-zero return from a critical function call' \
        'extras:Issued function name' \
        "${@:2}"

    return "${?}"
}


#
# Attempts to determine the value of the requested key for the given array. The
# first argument is the name of the array, and the second argument is the key
# to lookup within said array.
#

function _resolve_indirect_assoc() {
    local -n map="${1}"
    local    key="${2:-}"

    if [[ -z "${key}" ]] || [[ ! ${map[$key]+_} ]]; then
        return 255
    fi

    _out_format "${map[$key]}"
}


#
# Locates and returns the control value
# returns the control value for the passed style type
#

function _control_style() {
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

    _resolve_indirect_assoc 'style_maps' "${style_name}"
    return "${?}"
}

#
# returns the control value for the passed style type
#
function _control_reset() {
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

    _resolve_indirect_assoc style_maps "$style_name"
    return "${?}"
}

#
# returns the control value for the passed foreground color
#
function _control_fg() {
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

    _resolve_indirect_assoc color_maps "$color_name"

    return "${?}"
}

#
# returns the control value for the passed background color
#
function _control_bg() {
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

    _resolve_indirect_assoc color_maps "$color_name"

    return "${?}"
}

#
# return the control value for the passed rgb string and context
#
function _control_rgb() {
    local rgb="${1}"
    local int="${2:-38}"
    local tmp="${rgb%,*}"
    local r="${rgb%%,*}"
    local b="${tmp##*,}"
    local g="${rgb##*,}"

    if [[ "${int}" -ne 38 ]] && [[ "${int}" -ne 48 ]]; then
        _error_invalid_range \
            "${FUNCNAME[*]}" \
            'Invalid rgb context type; only 38 (for foreground) and 48 (for background) supported.' \
            "${int}"
        return 255
    fi

    [[ -z "${r}" ]] \
        || [[ ${r} -lt 0 ]] \
        || [[ ${r} -gt 255 ]] \
        || [[ -z "${b}" ]] \
        || [[ ${b} -lt 0 ]] \
        || [[ ${b} -gt 255 ]] \
        || [[ -z "${g}" ]] \
        || [[ ${g} -lt 0 ]] \
        || [[ ${g} -gt 255 ]] \
        && return

    _out_format '%d;2;%d;%d;%d' "${int}" "${r}" "${b}" "${g}"
}

#
# returns the control value for the passed rgb string foreground color
#
function _control_fg_rgb() {
    _control_rgb "${1}" 38
}

#
# returns the control value for the passed rgb string background color
#
function _control_bg_rgb() {
    _control_rgb "${1}" 48
}

#
# trim whitespace from beginning and end of string
#
function _str_trim() {
    _out_format "${1}" | \
        tr -d '\n' 2> /dev/null | \
        tr -d '\r' 2> /dev/null | \
        sed -e 's/^[ \t]*//' -e 's/[ \t]*$//' 2> /dev/null
}

#
# trim whitespace from beginning and end of string
#

function _str_tran() {
    _out_format "${1}" | \
        sed -e 's/-/_/' 2> /dev/null
}


#
# get the type of the passed name (such as function or variable)
#

function __get_type() {
    local what="${1}"
    local type

    if ! type=$(type -t "${what}" 2> /dev/null); then
        _out_format 'undefined'
        return 1
    fi

    _out_format "${type}"
}


#
# checks if the passed name matches the expected type
#

function __is_type() {
    local what="${1}"
    local type="${2:-_}"

    if [[ "$(__get_type "${what}")" != "${type}" ]]; then
        return 1
    fi
}


#
# build the output string based on the passed control commands
#

function _builder() {
    local    str
    local    cmd
    local    ret
    local    ctl_key
    local    ctl_val
    local -a ctl_codes

    until [[ $# -eq 0 ]] && [[ -z "${1}" ]]; do
        if [[ "${1:0:4}" == "str:" ]] && [[ ${#1} -gt 4 ]]; then
            str="${1:4}"
        else
            for c in ${1}; do
                ctl_key="$(_str_trim "$(_str_tran "${c%%:*}")")"
                ctl_val="$(_str_trim "${c#*:}")"
                cmd="_control_${ctl_key}"

                if ! __is_type "${cmd}" 'function'; then
                    _error_invalid_type "${FUNCNAME[*]}" 'function' "${cmd}"
                    continue
                fi

                if ! ret="$(${cmd} "${ctl_val}")"; then
                    _error_non_zero_func "${FUNCNAME[*]}" "${cmd}"
                    continue
                fi

                ctl_codes+=("${ret}")
            done
        fi
        shift || break
    done

    _ansi_control_seq "${str:-}" "${ctl_codes[@]}"
}


#
# build the output string based on the passed control commands
#

function _builder_return() {
    _builder "str:${1}" "${@:2}" \
        && _auto_reset \
        || return "${?}"
}


#
# build the output string based on the passed control commands and output it
#

function _builder_output() {
    _out_interp "$(_builder "str:${1}" "${@:2}" && _auto_reset)" \
        || return "${?}"
}



#
# Output ansi control sequence with the relevant text.
#

function _ansi_control_seq() {
    local message="${1}"
    shift
    local control

    until [[ $# -eq 0 ]]; do
        control+="${control:+;}${1}"
        shift || break
    done

    if [[ ${#control} -eq 0 ]]; then
        _out_format "${message}"
    else
        _out_format "\%s[%sm%s" '033' "${control}" "${message}"
    fi
}
