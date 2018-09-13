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
# output control string with default foreground
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_default() {
    _str_builder_get "bg:default" "${@}" \
        || return ${?}
}


#
# output string with default foreground
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_default() {
    _str_builder_out "${1}" "bg:default" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with black foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_black() {
    _str_builder_get "bg:black" "${@:2}" \
        || return ${?}
}


#
# output string with black foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_black() {
    _str_builder_out "${1}" "bg:black" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with red foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_red() {
    _str_builder_get "bg:red" "${@:2}" \
        || return ${?}
}


#
# output string with red foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_red() {
    _str_builder_out "${1}" "bg:red" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with green foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_green() {
    _str_builder_get "bg:green" "${@:2}" \
        || return ${?}
}


#
# output string with green foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_green() {
    _str_builder_out "${1}" "bg:green" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with yellow foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_yellow() {
    _str_builder_get "bg:yellow" "${@:2}" \
        || return ${?}
}


#
# output string with yellow foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_yellow() {
    _str_builder_out "${1}" "bg:yellow" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with blue foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_blue() {
    _str_builder_get "bg:blue" "${@}" \
        || return ${?}
}


#
# output string with blue foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_blue() {
    _str_builder_out "${1}" "bg:blue" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with magenta foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_magenta() {
    _str_builder_get "bg:magenta" "${@}" \
        || return ${?}
}


#
# output string with magenta foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_magenta() {
    _str_builder_out "${1}" "bg:magenta" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with cyan foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_cyan() {
    _str_builder_get "bg:cyan" "${@}" \
        || return ${?}
}


#
# output string with cyan foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_cyan() {
    _str_builder_out "${1}" "bg:cyan" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with white foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_white() {
    _str_builder_get "bg:white" "${@}" \
        || return ${?}
}


#
# output string with white foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_white() {
    _str_builder_out "${1}" "bg:white" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with black foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_light_black() {
    _str_builder_get "bg:light-black" "${@}" \
        || return ${?}
}


#
# output string with black foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_light_black() {
    _str_builder_out "${1}" "bg:light-black" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with red foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_light_red() {
    _str_builder_get "bg:light-red" "${@}" \
        || return ${?}
}


#
# output string with red foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_light_red() {
    _str_builder_out "${1}" "bg:light-red" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with green foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_light_green() {
    _str_builder_get "bg:light-green" "${@}" \
        || return ${?}
}


#
# output string with green foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_light_green() {
    _str_builder_out "${1}" "bg:light-green" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with yellow foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_light_yellow() {
    _str_builder_get "bg:light-yellow" "${@}" \
        || return ${?}
}


#
# output string with yellow foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_light_yellow() {
    _str_builder_out "${1}" "bg:light-yellow" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with blue foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_light_blue() {
    _str_builder_get "bg:light-blue" "${@}" \
        || return ${?}
}


#
# output string with blue foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_light_blue() {
    _str_builder_out "${1}" "bg:light-blue" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with magenta foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_light_magenta() {
    _str_builder_get "bg:light-magenta" "${@}" \
        || return ${?}
}


#
# output string with magenta foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_light_magenta() {
    _str_builder_out "${1}" "bg:light-magenta" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with cyan foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_light_cyan() {
    _str_builder_get "bg:light-cyan" "${@}" \
        || return ${?}
}


#
# output string with cyan foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_light_cyan() {
    _str_builder_out "${1}" "bg:light-cyan" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with white foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bg_light_white() {
    _str_builder_get "bg:light-white" "${@}" \
        || return ${?}
}


#
# output string with white foreground styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bg_light_white() {
    _str_builder_out "${1}" "bg:light-white" "${@:2}" \
        && _auto_nl \
        || return ${?}
}
