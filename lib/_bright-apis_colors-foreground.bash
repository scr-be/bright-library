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

function cmd_default_fg() {
    _builder_return "fg:default" "${@}" \
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

function out_default_fg() {
    _builder_output "${1}" "fg:default" "${@:2}" \
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

function cmd_black() {
    _builder_return "fg:black" "${@}" \
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

function out_black() {
    _builder_output "${1}" "fg:black" "${@:2}" \
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

function cmd_red() {
    _builder_return "fg:red" "${@}" \
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

function out_red() {
    _builder_output "${1}" "fg:red" "${@:2}" \
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

function cmd_green() {
    _builder_return "fg:green" "${@}" \
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

function out_green() {
    _builder_output "${1}" "fg:green" "${@:2}" \
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

function cmd_yellow() {
    _builder_return "fg:yellow" "${@}" \
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

function out_yellow() {
    _builder_output "${1}" "fg:yellow" "${@:2}" \
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

function cmd_blue() {
    _builder_return "fg:blue" "${@}" \
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

function out_blue() {
    _builder_output "${1}" "fg:blue" "${@:2}" \
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

function cmd_magenta() {
    _builder_return "fg:magenta" "${@}" \
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

function out_magenta() {
    _builder_output "${1}" "fg:magenta" "${@:2}" \
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

function cmd_cyan() {
    _builder_return "fg:cyan" "${@}" \
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

function out_cyan() {
    _builder_output "${1}" "fg:cyan" "${@:2}" \
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

function cmd_white() {
    _builder_return "fg:white" "${@}" \
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

function out_white() {
    _builder_output "${1}" "fg:white" "${@:2}" \
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

function cmd_light_black() {
    _builder_return "fg:light-black" "${@}" \
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

function out_light_black() {
    _builder_output "${1}" "fg:light-black" "${@:2}" \
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

function cmd_light_red() {
    _builder_return "fg:light-red" "${@}" \
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

function out_light_red() {
    _builder_output "${1}" "fg:light-red" "${@:2}" \
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

function cmd_light_green() {
    _builder_return "fg:light-green" "${@}" \
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

function out_light_green() {
    _builder_output "${1}" "fg:light-green" "${@:2}" \
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

function cmd_light_yellow() {
    _builder_return "fg:light-yellow" "${@}" \
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

function out_light_yellow() {
    _builder_output "${1}" "fg:light-yellow" "${@:2}" \
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

function cmd_light_blue() {
    _builder_return "fg:light-blue" "${@}" \
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

function out_light_blue() {
    _builder_output "${1}" "fg:light-blue" "${@:2}" \
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

function cmd_light_magenta() {
    _builder_return "fg:light-magenta" "${@}" \
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

function out_light_magenta() {
    _builder_output "${1}" "fg:light-magenta" "${@:2}" \
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

function cmd_light_cyan() {
    _builder_return "fg:light-cyan" "${@}" \
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

function out_light_cyan() {
    _builder_output "${1}" "fg:light-cyan" "${@:2}" \
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

function cmd_light_white() {
    _builder_return "fg:light-white" "${@}" \
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

function out_light_white() {
    _builder_output "${1}" "fg:light-white" "${@:2}" \
        && _auto_nl \
        || return ${?}
}
