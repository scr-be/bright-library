#!/bin/bash

#
# Bight: Bash Color Library
#
# MIT License
# Copyright 2016 Rob Frawley <rmf@src.run>
#

function _bright_resolve()
{
    local -n map="$1"
    local    key="$2"

    if [ ! ${map[$key]+_} ]; then
        echo "_bright_resolve: argument \"$key\" is out of range" >&2
        return 1
    fi

    echo ${map[$key]}
}

function _bright_escape
{
    local esc="\033["
    local str="$1"

    until [ -z "$2" ]; do
        if ! [ $2 -ge 0 -a $2 -le 47 ] 2>/dev/null; then
            echo "_bright_escape: argument \"$2\" is out of range" >&2
            return 1
        fi

        str="${esc}${2}m${str}${esc}$(bright_get_control escape)m"

        shift || break
    done

    echo -e "$str"
}

function bright_get_color()
{
    local    _key="$1"
    local -A _color=( [black]=30 [red]=31 [green]=32 [brown]=33 [blue]=34 [magenta]=35 [cyan]=36 [white]=37 )

    _bright_resolve _color $_key
}

function bright_get_bgcolor()
{
    local    _key="$1"
    local -A _bgcolor=( [black]=40 [red]=41 [green]=42 [brown]=43 [blue]=44 [magenta]=45 [cyan]=46 [white]=47 )

    _bright_resolve _bgcolor $_key
}

function bright_get_control()
{
    local    _key=$1
    local -A _control=( [escape]=0 [underline]=24 [reverse]=27 [bold]=1 [bright]=2 [underscore]=4 [reverse]=7 )

    _bright_resolve _control $_key
}

function bright_get_default()
{
    local    _key=$1
    local -A _default=( [fg]=39 [bg]=49 )

    _bright_resolve _default $_key
}

function bright_escape() {
    _bright_escape "$1" $(bright_get_control escape)
}

function bright_default() {
    _bright_escape "$1" $(bright_get_default fg)
}

function bright_bgdefault() {
    _bright_escape "$1" $(bright_get_default bg)
}

function bright_underline() {
    _bright_escape "$1" $(bright_get_control underline)
}

function bright_reverse() {
    _bright_escape "$1" $(bright_get_control reverse)
}

function bright_bold() {
    _bright_escape "$1" $(bright_get_control bold)
}

function bright_bright() {
    _bright_escape "$1" $(bright_get_control bright)
}

function bright_underscore() {
    _bright_escape "$1" $(bright_get_control underscore)
}

function bright_black() {
    _bright_escape "$1" $(bright_get_color black)
}

function bright_red() {
    _bright_escape "$1" $(bright_get_color red)
}

function bright_green() {
    _bright_escape "$1" $(bright_get_color green)
}

function bright_brown() {
    _bright_escape "$1" $(bright_get_color brown)
}

function bright_blue() {
    _bright_escape "$1" $(bright_get_color blue)
}

function bright_magenta() {
    _bright_escape "$1" $(bright_get_color magenta)
}

function bright_cyan() {
    _bright_escape "$1" $(bright_get_color cyan)
}

function bright_white() {
    _bright_escape "$1" $(bright_get_color white)
}

function bright_bg_black() {
    _bright_escape "$1" $(bright_get_bgcolor black)
}

function bright_bg_red() {
    _bright_escape "$1" $(bright_get_bgcolor red)
}

function bright_bg_green() {
    _bright_escape "$1" $(bright_get_bgcolor green)
}

function bright_bg_brown() {
    _bright_escape "$1" $(bright_get_bgcolor brown)
}

function bright_bg_blue() {
    _bright_escape "$1" $(bright_get_bgcolor blue)
}

function bright_bg_magenta() {
    _bright_escape "$1" $(bright_get_bgcolor magenta)
}

function bright_bg_cyan() {
    _bright_escape "$1" $(bright_get_bgcolor cyan)
}

function bright_bg_white() {
    _bright_escape "$1" $(bright_get_bgcolor white)
}

# EOF
