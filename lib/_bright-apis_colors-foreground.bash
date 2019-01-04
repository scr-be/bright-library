#!/bin/bash

##
## This file is part of the `src-run/bash-bright-library` package.
##
## (c) Rob Frawley 2nd <rmf@src.run>
##
## For the full copyright and license information, view the LICENSE.md
## file distributed with this source code.
##


#
# output control string with default foreground
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_default() {
    _get '@fg:default' "${@}" || return ${?}
}


#
# output string with default foreground
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_default() {
    _get_fg_default '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with black foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_black() {
    _get '@fg:black' "${@}" || return ${?}
}


#
# output string with black foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_black() {
    _get_fg_black '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with red foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_red() {
    _get '@fg:red' "${@}" || return ${?}
}


#
# output string with red foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_red() {
    _get_fg_red '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with green foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_green() {
    _get '@fg:green' "${@}" || return ${?}
}


#
# output string with green foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_green() {
    _get_fg_green '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with yellow foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_yellow() {
    _get '@fg:yellow' "${@}" || return ${?}
}


#
# output string with yellow foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_yellow() {
    _get_fg_yellow '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with blue foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_blue() {
    _get '@fg:blue' "${@}" || return ${?}
}


#
# output string with blue foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_blue() {
    _get_fg_blue '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with magenta foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_magenta() {
    _get '@fg:magenta' "${@}" || return ${?}
}


#
# output string with magenta foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_magenta() {
    _get_fg_magenta '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with cyan foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_cyan() {
    _get '@fg:cyan' "${@}" || return ${?}
}


#
# output string with cyan foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_cyan() {
    _get_fg_cyan '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with white foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_white() {
    _get '@fg:white' "${@}" || return ${?}
}


#
# output string with white foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_white() {
    _get_fg_white '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with black foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_light_black() {
    _get '@fg:light-black' "${@}" || return ${?}
}


#
# output string with black foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_light_black() {
    _get_fg_light_black '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with red foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_light_red() {
    _get '@fg:light-red' "${@}" || return ${?}
}


#
# output string with red foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_light_red() {
    _get_fg_light_red '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with green foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_light_green() {
    _get '@fg:light-green' "${@}" || return ${?}
}


#
# output string with green foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_light_green() {
    _get_fg_light_green '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with yellow foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_light_yellow() {
    _get '@fg:light-yellow' "${@}" || return ${?}
}


#
# output string with yellow foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_light_yellow() {
    _get_fg_light_yellow '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with blue foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_light_blue() {
    _get '@fg:light-blue' "${@}" || return ${?}
}


#
# output string with blue foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_light_blue() {
    _get_fg_light_blue '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with magenta foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_light_magenta() {
    _get '@fg:light-magenta' "${@}" || return ${?}
}


#
# output string with magenta foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_light_magenta() {
    _get_fg_light_magenta '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with cyan foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_light_cyan() {
    _get '@fg:light-cyan' "${@}" || return ${?}
}


#
# output string with cyan foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_light_cyan() {
    _get_fg_light_cyan '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with white foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_fg_light_white() {
    _get '@fg:light-white' "${@}" || return ${?}
}


#
# output string with white foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_fg_light_white() {
    _get_fg_light_white '@ctl:interpret' "${@}" || return ${?}
}
