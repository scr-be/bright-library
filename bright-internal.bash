#!/bin/bash

##
# This file is part of the `bright-library` package.
#
# (c) Rob Frawley 2nd <rmf@src.run>
#
# For the full copyright and license information, view the LICENSE.md
# file distributed with this source code.
##

#
# basic error handler for internal function exceptions
#
function _bright_error_handler()
{
    local mesg="[${1:-unset_function}] ${2:-unspecified exception}"
    local args

    while [ $# != 2 ] && [ "$3" != false ]; do
        args+="\"$3\","
        shift
    done

    [ "$args" ] && mesg+=" (got ${args:0:-1})"
    echo "$mesg" >&2

    [ "$stop" == "true" ] && exit $retint
    return $retint
}

#
# output newline depending on global configuration
#
function _bright_out_newline()
{
    if [[ $BRIGHT_AUTO_NL -eq 1 ]]; then
        echo -en "\n"
    fi
}

#
# determine value from map array and index/key
#
function _bright_map_resolver()
{
    local -n map="$1"
    local    key="$2"

    if [ ! ${map[$key]+_} ]; then
        _bright_error_handler $FUNCNAME "argument is out of range" "$key" || return $?
    fi

    echo ${map[$key]}
}

#
# returns the control value for the passed style type
#
function _bright_control_style()
{
    local    style_name="$1"
    local -A styles=(
        [bold]=1
        [bright]=1
        [dim]=2
        [underline]=4
        [blink]=5
        [reverse]=7
        [hidden]=8
    )

    _bright_map_resolver styles "$style_name"
    return $?
}

#
# returns the control value for the passed style type
#
function _bright_control_reset()
{
    local    style_name="${1:-all}"
    local -A styles=(
        [all]=0
        [bold]=21
        [bright]=21
        [dim]=22
        [underline]=24
        [blink]=25
        [reverse]=27
        [hidden]=28
    )

    _bright_map_resolver styles "$style_name"
    return $?
}

#
# returns the control value for the passed foreground color
#
function _bright_control_fg()
{
    local    color_name="$1"
    local -A colors=(
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

    _bright_map_resolver colors "$color_name"

    return $?
}

#
# returns the control value for the passed background color
#
function _bright_control_bg()
{
    local    color_name="$1"
    local -A colors=(
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

    _bright_map_resolver colors "$color_name"

    return $?
}

#
# trim whitespace from beginning and end of string
#
function _bright_str_trim()
{
    echo $(echo $1 | sed -e 's/^[ \t]*//')
}

#
# build the output string based on the passed control commands
#
function _bright_str_builder_return()
{
    local    str="$1"
    local    ctl=""
    local    cmd=""
    local    ret=""
    local -a ctl_codes=()

    until [ -z "$2" ]; do
        IFS=\: read -a ctl_part <<< "$(_bright_str_trim $2)"

        cmd="_bright_control_${ctl_part[0]}"
        ret="$($cmd "${ctl_part[1]}")"

        if ! [ $ret -ge 0 -a $ret -le 108 ]; then
            _bright_error_handler $FUNCNAME "expected range 0 through 107" "$ret" || return $?
        else
            ctl_codes+=($ret)
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

    if [[ $BRIGHT_AUTO_RESET -eq 1 ]]; then
        echo -en "\e[$(_bright_control_reset all)m"
    fi

    return $?
}
