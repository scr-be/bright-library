#!/bin/bash

##
# This file is part of the `bright-library` package.
#
# (c) Rob Frawley 2nd <rmf@src.run>
#
# For the full copyright and license information, view the LICENSE.md
# file distributed with this source code.
##

function _bright_error()
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

function bright_map_resolver()
{
    local -n map="$1"
    local    key="$2"

    if [ ! ${map[$key]+_} ]; then
        _bright_error $FUNCNAME "argument is out of range" "$key" || return $?
    fi

    echo ${map[$key]}
}

function bright_out_builder()
{
    local out="$1"

    until [ -z "$2" ]; do
        IFS=\: read -a part <<<"$2"

        cmd="bright_get_${part[0]}"
        ret="$($cmd "${part[1]}")"

        if ! [ $ret -ge 0 -a $ret -le 50 ]; then
            _bright_error $FUNCNAME "expected range 0 through 50" "$ret" || return $?
        fi

        out="\033[${ret}m${out}\033[0m"

        shift || break
    done

    echo -ne "$out"
    return 0
}

function bright_get_control()
{
    local    control_name="$1"
    local -A controls=(
        [control escape]=0
        [style underline]=24
        [style reverse]=27
        [style bold]=1
        [style bright]=2
        [style underscore]=4
        [style reverse]=7
        [default foreground]=39
        [default background]=49
    )

    bright_map_resolver controls "$control_name"
    return $?
}

function bright_get_color()
{
    local    color_name="$1"
    local    color_type="${2:-foreground}"
    local -A colors=(
        [foreground black]=30
        [foreground red]=31
        [foreground green]=32
        [foreground brown]=33
        [foreground blue]=34
        [foreground magenta]=35
        [foreground cyan]=36
        [foreground white]=37
        [background black]=40
        [background red]=41
        [background green]=42
        [background brown]=43
        [background blue]=44
        [background magenta]=45
        [background cyan]=46
        [background white]=47
    )

    case "$color_type" in
        foreground ) color_name="foreground $color_name" ;;
        background ) color_name="background $color_name" ;;
        * ) _bright_error $FUNCNAME "expected fore- or background but got" "$color_type" || return $? ;;
    esac

    bright_map_resolver colors "$color_name"
    return $?
}

function bright_get_color_bg()
{
    bright_get_color "$1" background
    return $?
}

function bright_out_default() {
    bright_out_builder "$1\n" "control:default foreground"
}

function bright_out_default_bg() {
    bright_out_builder "$1\n" "control:default background"
}

function bright_out_escape() {
    bright_out_builder "$1\n" "control:control escape"
}

function bright_out_underline() {
    bright_out_builder "$1\n" "control:style underline"
}

function bright_out_reverse() {
    bright_out_builder "$1\n" "control:style reverse"
}

function bright_out_bold() {
    bright_out_builder "$1\n" "control:style bold"
}

function bright_out_bright() {
    bright_out_builder "$1\n" "control:style bright"
}

function bright_out_underscore() {
    bright_out_builder "$1\n" "control:style underscore"
}

function bright_out_black() {
    bright_out_builder "$1\n" "color:black"
}

function bright_out_red() {
    bright_out_builder "$1\n" "color:red"
}

function bright_out_green() {
    bright_out_builder "$1\n" "color:green"
}

function bright_out_brown() {
    bright_out_builder "$1\n" "color:brown"
}

function bright_out_blue() {
    bright_out_builder "$1\n" "color:blue"
}

function bright_out_magenta() {
    bright_out_builder "$1\n" "color:magenta"
}

function bright_out_cyan() {
    bright_out_builder "$1\n" "color:cyan"
}

function bright_out_white() {
    bright_out_builder "$1\n" "color:white"
}

function bright_out_black_bg() {
    bright_out_builder "$1\n" "color_bg:black"
}

function bright_out_red_bg() {
    bright_out_builder "$1\n" "color_bg:red"
}

function bright_out_green_bg() {
    bright_out_builder "$1\n" "color_bg:green"
}

function bright_out_brown_bg() {
    bright_out_builder "$1\n" "color_bg:brown"
}

function bright_out_blubg() {
    bright_out_builder "$1\n" "color_bg:blue"
}

function bright_out_magenta_bg() {
    bright_out_builder "$1\n" "color_bg:magenta"
}

function bright_out_cyan_bg() {
    bright_out_builder "$1\n" "color_bg:cyan"
}

function bright_out_whitbg() {
    bright_out_builder "$1\n" "color_bg:white"
}

# EOF
