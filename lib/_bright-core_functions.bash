#!/bin/bash

##
## This file is part of the `src-run/bash-bright-library` package.
##
## (c) Rob Frawley 2nd <rmf@src.run>
##
## For the full copyright and license information, view the LICENSE.md
## file distributed with this source code.
##

# SC2059: Ignore warnings about variables in the printf format string. (intended)
# SC2034: Ignore warnings about local variables unused. (false match)
# SC2119: Ignore warnings about incorrect parameters usage. (false match)
# SC2120: Ignore warnings about referencing arguments not passed. (false match)
# shellcheck disable=SC2059
# shellcheck disable=SC2034
# shellcheck disable=SC2119
# shellcheck disable=SC2120


#
# Repeats the string passed as the first argument any number of time, as passed
# by the optional second argument. If no second argument is present, the string
# is only output once (and is therefore not repeated).
#

function _str_repeat() {
    local count=${1:-1}
    local value="${2:-$(</dev/stdin)}"

    for ((n=0; n<count; n++)); do
        printf -- "%s" "${value}"
    done
}


#
# trim whitespace from beginning and end of string
#
function _str_trim() {
    tr -d '\n' 2> /dev/null <<< "${1:-$(</dev/stdin)}" | \
        tr -d '\r' 2> /dev/null | \
        sed -e 's/^[ \t]*//' -e 's/[ \t]*$//' 2> /dev/null
}


#
# replace dashes with underscores
#

function _str_search_replace() {
    local work_string="${1:-$(</dev/stdin)}"
    local search_vals="${2}"
    local replacement="${3:-}"

    sed -e "s/${search_vals}/${replacement}/g" 2> /dev/null \
        <<< "${work_string}"
}


#
# replace dashes with underscores
#

function _str_dash_to_underscore() {
    _str_search_replace "${1:-$(</dev/stdin)}" '-' '_'
}


#
# replace underscores with dashes
#

function _str_underscore_to_dash() {
    _str_search_replace "${1:-$(</dev/stdin)}" '_' '-'
}


#
# removes all non-alphanumeric and dash/underscore characters from string
#

function _str_only_alpha_num_underscore_dash() {
    _str_search_replace "${1:-$(</dev/stdin)}" '[^a-zA-Z0-9_-]'
}


#
# removes all non-alphanumeric and dash/underscore characters from string
#

function _str_only_alpha_num_underscore_dash_comma() {
    _str_search_replace "${1:-$(</dev/stdin)}" '[^a-zA-Z0-9,_-]'
}


#
# replaces an exclamation mark with a "no-" string (normalizes negatives which
# can be represented as both "no-" and "!" before a value to "no-value")
#

function _str_expand_exclamation() {
    _str_search_replace "${1:-$(</dev/stdin)}" '^!' 'no-'
}


#
# replaces a plus sign with an "auto-" string (normalizes automatic-state which
# can be represented as both "auto-" and "+" before a value to "auto-value")
#

function _str_expand_plus_sign() {
    _str_search_replace "${1:-$(</dev/stdin)}" '^+' 'auto-'
}


#
# replaces a plus sign with an "auto-" string (normalizes automatic-state which
# can be represented as both "auto-" and "+" before a value to "auto-value")
#

function _str_expand_all_shorthand() {
    _str_expand_plus_sign <<< "${1:-$(</dev/stdin)}" \
        | _str_expand_exclamation
}


#
# removes all non-numeric characters from string
#

function _str_only_numbs() {
    _str_search_replace "${1:-$(</dev/stdin)}" '[^0-9]'
}


#
# surrounds the passed string in quotes as configured (double quotes by default)
#

function _str_quote() {
    local quote="${2:-\"}"
    local input="${1:-$(</dev/stdin)}"

    printf -- '%s%s%s' "${quote}" "${input}" "${quote}"
}


#
# Direct abstraction for regular printf function, accepting the same arguments
# as defined for printf. No call to print is made if argument count is 0. Does
# not intentionally interpret backslash escape sequences.
#

function _out_format() {
    local input="${1}"

    if [[ ${#} -gt 1 ]] && [[ ${1:-$input} = *%* ]]; then
        printf -- "${1:-$input}" "${@:2}" 2> /dev/null
    elif [[ ${#} -gt 0 ]] || [[ -n ${input} ]]; then
        printf -- "$(_str_repeat ${#} '%s')" "${input}" "${@:2}" 2> /dev/null
    fi
}


#
# Accepts the same arguments as _out_format and behaves exactly the same with
# the following singular difference: the compiled string is passed to echo for
# backslash escape sequence interpreting.
#

function _out_interp() {
    local input="${1:-$(</dev/stdin)}"

    if [[ ${#} -gt 0 ]] || [[ -n ${input} ]]; then
        echo -en "$(_out_format "${input}" "${@:2}")" 2> /dev/null
    fi
}


#
# Accepts the same arguments as _out_format and behaves exactly the same with
# the following singular difference: the compiled string is redirected from
# the STDOUT file descriptor to the STDERR file descriptor instead.
#

function _out_stderr() {
    local input="${1:-$(</dev/stdin)}"

    if [[ ${#} -gt 0 ]] || [[ -n ${input} ]]; then
        _out_interp "${input}" "${@:2}" >&2
    fi
}


#
# Outputs a required newline
#

function _out_return_reqd() {
    _out_format '%s' '\n'
}


#
# Outputs a newline automatically when global configuration is set to do so,
# otherwise this method performs no actions.
#

function _out_return_auto() {
    [[ ${_BRIGHT_AUTO_RETURN} -eq 1 ]] && _out_return_reqd
}


#
# Outputs a required style reset sequence.
#

function _out_resets_reqd() {
    _get_compiled_ansi_sequence "$(_control_reset all)"
}


#
# Outputs a style reset sequence automatically when global configuration is set
# to do so, otherwise this method performs no actions.
#

function _out_resets_auto() {
    [[ ${_BRIGHT_AUTO_RESETS} -eq 1 ]] && _out_resets_reqd
}


#
# get the type of the passed name (such as function or variable)
#

function _get_type() {
    local what="${1:-$(</dev/stdin)}"
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

function _is_type() {
    local type="${1:-_}"
    local what="${2:-$(</dev/stdin)}"

    if [[ $(_get_type "${what}") != "${type}" ]]; then
        return 1
    fi
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
        [[ ${f} != "main" ]] && text="${f}${text:+ }${text:-}"
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
        if [[ "${1:0:7}" == return: ]]; then
            code="${1:7}"
        elif [[ "${1:0:7}" == extras: ]]; then
            type="${1:7}"
        else
            args+=("$(printf '"%s"' "${1}")")
        fi

        shift || break
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

function _error_invalid_builder_arg() {
    _error_generic \
        "${1}" \
        'encountered invalid builder argument (likely an unrecognized control character)' \
        'extras:offending argument' \
        "${@:2}"

    return ${?}
}


#
# The internal error function customized for "invalid rgb contexts".
#

function _error_rgb_control_context() {
    _error_generic \
        "${1}" \
        "invalid rgb context: for foreground use 38 and for background use 48" \
        'extras:invalid context' \
        "${@:2}"

    return ${?}
}


#
# The internal error function customized for "invalid rgb control values".
#

function _error_rgb_control_value() {
    _error_generic \
        "${1}" \
        "invalid rgb integer: expected a value between 0 and 255" \
        'extras:invalid control' \
        "${@:2}"

    return ${?}
}


#
# The internal error function customized for "undefined" functions. The message
# is predefined and only the function name and extra arguments can be passed.
#

function _error_invalid_type() {
    _error_generic \
        "${1}" \
        "encountered an unmet ${2} type expectation" \
        'extras:invalid typed item' \
        "${@:3}"

    return ${?}
}


#
# The internal error function customized for "undefined" functions. The message
# is predefined and only the function name and extra arguments can be passed.
#

function _error_non_zero_func() {
    _error_generic \
        "${1}" \
        'encountered a non-zero return from a critical function call' \
        'extras:issued function name' \
        "${@:2}"

    return ${?}
}


#
# Attempts to determine the value of the requested key for the given array. The
# first argument is the name of the array, and the second argument is the key
# to lookup within said array.
#

function _resolve_indirect_assoc() {
    local -n map="${1}"
    local    key="${2:-}"

    if [[ -z ${key} ]] || [[ ! ${map[$key]+_} ]]; then
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
    return ${?}
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

    _resolve_indirect_assoc 'style_maps' "$style_name"
    return ${?}
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

    return ${?}
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

    return ${?}
}

#
# return the control value for the passed rgb string and context
#
function _control_rgb() {
    local c="${1}"
    local t="${2:-38}"
    local r
    local b
    local g

    if [[ ${t} -ne 38 ]] && [[ ${t} -ne 48 ]]; then
        _error_rgb_control_context "${FUNCNAME[*]}" "${t}" || return 255
    fi

    r=$(
        awk -F"," '{print $1}' <<< "${c}" 2> /dev/null \
            | _str_only_numbs
    )
    b=$(
        awk -F"," '{print $2}' <<< "${c}" 2> /dev/null \
            | _str_only_numbs
    )
    g=$(
        awk -F"," '{print $3}' <<< "${c}" 2> /dev/null \
            | _str_only_numbs
    )

    if [[ -z ${r} ]] || [[ ${r} -lt 0 ]] || [[ ${r} -gt 255 ]]; then
        _error_rgb_control_value "${FUNCNAME[*]}" "${r}" || return ${?}
    fi

    if [[ -z ${b} ]] || [[ ${b} -lt 0 ]] || [[ ${b} -gt 255 ]]; then
        _error_rgb_control_value "${FUNCNAME[*]}" "${b}" || return ${?}
    fi

    if [[ -z ${g} ]] || [[ ${g} -lt 0 ]] || [[ ${g} -gt 255 ]]; then
        _error_rgb_control_value "${FUNCNAME[*]}" "${g}" || return ${?}
    fi

    _out_format '%d;2;%d;%d;%d' "${t}" "${r}" "${b}" "${g}"
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
# get the type of the passed name (such as function or variable)
#

function _get_type() {
    local what="${1:-$(</dev/stdin)}"
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

function _is_type() {
    local type="${1:-_}"
    local what="${2:-$(</dev/stdin)}"

    if [[ $(_get_type "${what}") != "${type}" ]]; then
        return 1
    fi
}


#
# checks if the passed argument value is a definition of the expected type(s)
#

function _is_instruction() {
    local -a keys=("${@:1}")
    local    name="${1}"

    for k in "${keys[@]}"; do
        if [[ ${name:0:$(( ${#k} + 2 ))} == "@${k}:" ]]; then
            return 0
        fi
    done

    return 1
}


#
# checks if the passed name matches the expected control instruction format
#

function _is_instruction_style_definition() {
    _is_instruction "${1}" 'fg' 'fg-rgb' 'bg' 'bg-rgb' 'style' 'reset' \
        || return $?
}


#
# checks if the passed name matches the expected control instruction format
#

function _is_instruction_control_definition() {
    _is_instruction "${1}" 'ctl' \
        || return $?
}


#
# parses the key string from the combined instruction and sanitizes it for use
#

function _get_instruction_index() {
    _str_trim <<< "${1%%:*}" \
        | _str_dash_to_underscore \
        | _str_only_alpha_num_underscore_dash
}


#
# parses the val string from the combined instruction and sanitizes it for use
#

function _get_instruction_value() {
    _str_trim <<< "${1#*:}" \
        | _str_underscore_to_dash \
        | _str_expand_all_shorthand \
        | _str_only_alpha_num_underscore_dash_comma
}


#
# parses the cmd string from the combined instruction and sanitizes it for use
#

function _get_instruction_sfunc() {
    _out_format '_control_%s' "$(_get_instruction_index "${1}")"
}


#
# removes state prefix from control value (such as removing "no-" or "auto-")
#
function _get_control_no_prefix() {
    sed -E 's/^([a-z]+-)?(.+)/\2/g' <<< "$(_get_instruction_value "${1}")"
}


#
# return an integer state for the passed control value (-1 for auto, 0 for no,
# and 1 for enabled).
#
function _get_control_state() {
    local ctrl_value="${1}"

    case "${ctrl_value}" in
        auto-* ) _out_format -1 ;;
        no-*   ) _out_format  0 ;;
        *      ) _out_format  1 ;;
    esac
}



#
# Output ANSI control sequence with the relevant text.
#

function _get_compiled_ansi_sequence() {
    local codes

    until [[ $# -eq 0 ]]; do
        codes+="${codes:+;}${1}"
        shift || break
    done

    [[ ${#ansi_codes} -gt 0 ]] \
        && _out_format '\%s[%sm' '033' "${codes}" \
        || _out_format ''
}


#
# TODO
#

function _out_compiled_string() {
    local out_codes="${1:-}"
    local out_value="${2:-}"
    local do_interp=${3:-0}
    local do_resets=${4:-0}
    local do_return=${5:-0}
    local out_sfunc

    [[ ${do_interp} -eq 1 ]] \
        && out_sfunc='_out_interp' \
        || out_sfunc='_out_format'

    ${out_sfunc} '%s%s' "${out_codes}" "${out_value}"

    [[ ${do_resets} -eq -1 ]] && ${out_sfunc} '%s' "$(_out_resets_auto)"
    [[ ${do_resets} -eq  1 ]] && ${out_sfunc} '%s' "$(_out_resets_reqd)"
    [[ ${do_return} -eq -1 ]] && ${out_sfunc} '%s' "$(_out_return_auto)"
    [[ ${do_return} -eq  1 ]] && ${out_sfunc} '%s' "$(_out_return_reqd)"
}


#
# build the output string based on the passed control commands
#

function _builder() {
    local -a ansi_codes
    local    ansi_tcode

    local    inst_index
    local    inst_value
    local    inst_named

    local    out_string
    local    out_interp=0
    local    out_resets=-1
    local    out_return=-1

    until [[ ${#} -eq 0 ]] && [[ -z ${1} ]]; do
        if _is_instruction_style_definition "${1}"; then
            for c in ${1}; do
                inst_named=$(_get_instruction_sfunc "${c}")
                inst_value=$(_get_instruction_value "${c}")

                if ! _is_type 'function' "${inst_named}"; then
                    _error_invalid_type "${FUNCNAME[*]}" 'function' "${inst_named}"
                    continue
                fi

                if ! ansi_tcode="$(${inst_named} "${inst_value}")"; then
                    _error_non_zero_func "${FUNCNAME[*]}" "${inst_named}"
                    continue
                fi

                ansi_codes+=("${ansi_tcode}")
            done
        elif _is_instruction_control_definition "${1}"; then
            inst_index=$(_get_instruction_index "${1}")
            inst_named=$(_get_control_no_prefix "${1}")
            inst_value=$(_get_instruction_value "${1}")

            case "${inst_index}" in
                ctl)
                    case "${inst_named}" in
                        nl|newline|return)
                            out_return=$(_get_control_state "${inst_value}")
                            ;;
                        r|reset|clear)
                            out_resets=$(_get_control_state "${inst_value}")
                            ;;
                        i|interp|interpret)
                            out_interp=$(_get_control_state "${inst_value}")
                            ;;
                    esac
                    ;;

                * )
                    _error_invalid_builder_arg "${FUNCNAME[*]}" "${1}"
                    shift || break
                    continue
                    ;;
            esac
        else
            if [[ -n ${out_string} ]]; then
                _error_invalid_builder_arg "${FUNCNAME[*]}" "${1}"
                shift || break
                continue
            fi

            out_string="${1}"
        fi

        shift || break
    done

    _out_compiled_string \
        "$(_get_compiled_ansi_sequence "${ansi_codes[@]}")" \
        "${out_string}" \
        "${out_interp}" \
        "${out_resets}" \
        "${out_return}"
}


#
# build the output string based on the passed control commands
#

function _builder_return() {
    _builder '@ctl:no-nl' '@ctl:no-reset' '@ctl:no-interpret' "${@}" \
        || return ${?}
}


#
# build the output string based on the passed control commands and output it
#

function _builder_output() {
    _builder '@ctl:auto-nl' '@ctl:auto-reset' '@ctl:interpret' "${@}" \
        || return ${?}
}
