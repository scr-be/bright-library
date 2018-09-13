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
# output control string with bold styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bold() {
    _str_builder_get "style:bold" "${@}" \
        || return ${?}
}


#
# output string with bold styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bold() {
    _str_builder_out "${1}" "style:bold" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with bright styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_bright() {
    _str_builder_get "style:bright" "${@}" \
        || return ${?}
}


#
# output string with bright styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_bright() {
    _str_builder_out "${1}" "style:bright" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with dim styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_dim() {
    _str_builder_get "style:dim" "${@}" \
        || return ${?}
}


#
# output string with dim styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_dim() {
    _str_builder_out "${1}" "style:dim" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with underline styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_underline() {
    _str_builder_get "style:underline" "${@}" \
        || return ${?}
}


#
# output string with underline styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_underline() {
    _str_builder_out "${1}" "style:underline" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with blink styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_blink() {
    _str_builder_get "style:blink" "${@}" \
        || return ${?}
}


#
# output string with blink styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_blink() {
    _str_builder_out "${1}" "style:blink" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with reverse styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_reverse() {
    _str_builder_get "style:reverse" "${@}" \
        || return ${?}
}


#
# output string with reverse styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_reverse() {
    _str_builder_out "${1}" "style:reverse" "${@:2}" \
        && _auto_nl \
        || return ${?}
}


#
# output control string with hidden styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function cmd_hidden() {
    _str_builder_get "style:hidden" "${@}" \
        || return ${?}
}


#
# output string with hidden styled formatting
#
# @param string      ${1} string to output
# @param string|null ...  additional controls to apply
#
# @return int
#

function out_hidden() {
    _str_builder_out "${1}" "style:hidden" "${@:2}" \
        && _auto_nl \
        || return ${?}
}
