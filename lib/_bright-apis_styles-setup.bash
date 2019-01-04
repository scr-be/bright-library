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
# output control string with bold styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bold() {
    _get '@style:bold' "${@}" || return ${?}
}


#
# output string with bold styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bold() {
    _get_bold '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with bright styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_bright() {
    _get '@style:bright' "${@}" || return ${?}
}


#
# output string with bright styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_bright() {
    _get_bright '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with dim styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_dim() {
    _get '@style:dim' "${@}" || return ${?}
}


#
# output string with dim styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_dim() {
    _get_dim '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with underline styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_underline() {
    _get '@style:underline' "${@}" || return ${?}
}


#
# output string with underline styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_underline() {
    _get_underline '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with blink styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_blink() {
    _get '@style:blink' "${@}" || return ${?}
}


#
# output string with blink styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_blink() {
    _get_blink '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with reverse styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_reverse() {
    _get '@style:reverse' "${@}" || return ${?}
}


#
# output string with reverse styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_reverse() {
    _get_reverse '@ctl:interpret' "${@}" || return ${?}
}


#
# output control string with hidden styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_hidden() {
    _get '@style:hidden' "${@}" || return ${?}
}


#
# output string with hidden styled formatting
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_hidden() {
    _get_hidden '@ctl:interpret' "${@}" || return ${?}
}
