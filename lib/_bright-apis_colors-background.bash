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

function _get_bg_default() {
    _get '@bg:default' "${@}" || return ${?}
}


#
# output string with default foreground
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_default() {
    _get_bg_default '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with black foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_black() {
    _get '@bg:black' "${@:2}" || return ${?}
}


#
# output string with black foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_black() {
    _get_bg_black '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with red foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_red() {
    _get '@bg:red' "${@:2}" || return ${?}
}


#
# output string with red foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_red() {
    _get_bg_red '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with green foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_green() {
    _get '@bg:green' "${@:2}" || return ${?}
}


#
# output string with green foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_green() {
    _get_bg_green '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with yellow foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_yellow() {
    _get '@bg:yellow' "${@:2}" || return ${?}
}


#
# output string with yellow foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_yellow() {
    _get_bg_yellow '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with blue foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_blue() {
    _get '@bg:blue' "${@}" || return ${?}
}


#
# output string with blue foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_blue() {
    _get_bg_blue '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with magenta foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_magenta() {
    _get '@bg:magenta' "${@}" || return ${?}
}


#
# output string with magenta foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_magenta() {
    _get_bg_magenta '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with cyan foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_cyan() {
    _get '@bg:cyan' "${@}" || return ${?}
}


#
# output string with cyan foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_cyan() {
    _get_bg_cyan '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with white foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_white() {
    _get '@bg:white' "${@}" || return ${?}
}


#
# output string with white foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_white() {
    _get_bg_white '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with black foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_light_black() {
    _get '@bg:light-black' "${@}" || return ${?}
}


#
# output string with black foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_light_black() {
    _get_bg_light_black '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with red foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_light_red() {
    _get '@bg:light-red' "${@}" || return ${?}
}


#
# output string with red foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_light_red() {
    _get_bg_light_red '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with green foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_light_green() {
    _get '@bg:light-green' "${@}" || return ${?}
}


#
# output string with green foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_light_green() {
    _get_bg_light_green '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with yellow foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_light_yellow() {
    _get '@bg:light-yellow' "${@}" || return ${?}
}


#
# output string with yellow foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_light_yellow() {
    _get_bg_light_yellow '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with blue foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_light_blue() {
    _get '@bg:light-blue' "${@}" || return ${?}
}


#
# output string with blue foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_light_blue() {
    _get_bg_light_blue '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with magenta foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_light_magenta() {
    _get '@bg:light-magenta' "${@}" || return ${?}
}


#
# output string with magenta foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_light_magenta() {
    _get_bg_light_magenta '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with cyan foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_light_cyan() {
    _get '@bg:light-cyan' "${@}" || return ${?}
}


#
# output string with cyan foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_light_cyan() {
    _get_bg_light_cyan '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with white foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bg_light_white() {
    _get '@bg:light-white' "${@}" || return ${?}
}


#
# output string with white foreground styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bg_light_white() {
    _get_bg_light_white '@ctl:interpret' "${@}" || return ${?}
}
