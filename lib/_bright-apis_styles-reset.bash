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
# reset all colors and styles
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_reset() {
    _get '@reset:all' "${@}" || return ${?}
}


#
# reset all colors and styles
#
# @param string ... any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_reset() {
    _get_reset '@ctl:interpret' "${@}" || return ${?}
}


#
# reset bold style to default
#
# @param string ...reset bold style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_reset_bold() {
    _get '@reset:bold' "${@}" || return ${?}
}


#
# reset bold style to default
#
# @param string ...reset bold style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_reset_bold() {
    _get_reset_bold '@ctl:interpret' "${@}" || return ${?}
}


#
# reset bright style to default
#
# @param string ...reset bright style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_reset_bright() {
    _get '@reset:bright' "${@}" || return ${?}
}


#
# reset bright style to default
#
# @param string ...reset bright style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_reset_bright() {
    _get_reset_bright '@ctl:interpret' "${@}" || return ${?}
}


#
# reset dim style to default
#
# @param string ...reset dim style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_reset_dim() {
    _get '@reset:dim' "${@}" || return ${?}
}


#
# reset dim style to default
#
# @param string ...reset dim style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_reset_dim() {
    _get_reset_dim '@ctl:interpret' "${@}" || return ${?}
}


#
# reset underline style to default
#
# @param string ...reset underline style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_reset_underline() {
    _get '@reset:underline' "${@}" || return ${?}
}


#
# reset underline style to default
#
# @param string ...reset underline style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_reset_underline() {
    _get_reset_underline '@ctl:interpret' "${@}" || return ${?}
}


#
# reset blink style to default
#
# @param string ...reset blink style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_reset_blink() {
    _get '@reset:blink' "${@}" || return ${?}
}


#
# reset blink style to default
#
# @param string ...reset blink style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_reset_blink() {
    _get_reset_blink '@ctl:interpret' "${@}" || return ${?}
}


#
# reset reverse style to default
#
# @param string ...reset reverse style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_reset_reverse() {
    _get '@reset:reverse' "${@}" || return ${?}
}


#
# reset reverse style to default
#
# @param string ...reset reverse style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_reset_reverse() {
    _get_reset_reverse '@ctl:interpret' "${@}" || return ${?}
}


#
# reset hidden style to default
#
# @param string ...reset hidden style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get_reset_hidden() {
    _get '@reset:hidden' "${@}" || return ${?}
}


#
# reset hidden style to default
#
# @param string ...reset hidden style to default any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out_reset_hidden() {
    _get_reset_hidden '@ctl:interpret' "${@}" || return ${?}
}
