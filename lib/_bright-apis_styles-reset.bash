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
# reset all colors and styles
#
# @return int
#

function cmd_reset() {
    _str_builder_get 'reset:all' \
        || return ${?}
}


#
# reset all colors and styles
#
# @return int
#

function out_reset() {
    _str_builder_out '' 'reset:all' \
        && _auto_nl \
        || return ${?}
}


#
# reset bold style to default
#
# @return int
#

function cmd_bold_reset() {
    _str_builder_get 'reset:bold' \
        || return ${?}
}


#
# reset bold style to default
#
# @return int
#

function out_bold_reset() {
    _str_builder_out '' 'reset:bold' \
        && _auto_nl \
        || return ${?}
}


#
# reset bright style to default
#
# @return int
#

function cmd__reset() {
    _str_builder_get 'reset:bright' \
        || return ${?}
}


#
# reset bright style to default
#
# @return int
#

function out__reset() {
    _str_builder_out '' 'reset:bright' \
        && _auto_nl \
        || return ${?}
}


#
# reset dim style to default
#
# @return int
#

function cmd_dim_reset() {
    _str_builder_get 'reset:dim' \
        || return ${?}
}


#
# reset dim style to default
#
# @return int
#

function out_dim_reset() {
    _str_builder_out '' 'reset:dim' \
        && _auto_nl \
        || return ${?}
}


#
# reset underline style to default
#
# @return int
#

function cmd_underline_reset() {
    _str_builder_get 'reset:underline' \
        || return ${?}
}


#
# reset underline style to default
#
# @return int
#

function out_underline_reset() {
    _str_builder_out '' 'reset:underline' \
        && _auto_nl \
        || return ${?}
}


#
# reset blink style to default
#
# @return int
#

function cmd_blink_reset() {
    _str_builder_get 'reset:blink' \
        || return ${?}
}


#
# reset blink style to default
#
# @return int
#

function out_blink_reset() {
    _str_builder_out '' 'reset:blink' \
        && _auto_nl \
        || return ${?}
}


#
# reset reverse style to default
#
# @return int
#

function cmd_reverse_reset() {
    _str_builder_get 'reset:reverse' \
        || return ${?}
}


#
# reset reverse style to default
#
# @return int
#

function out_reverse_reset() {
    _str_builder_out '' 'reset:reverse' \
        && _auto_nl \
        || return ${?}
}


#
# reset hidden style to default
#
# @return int
#

function cmd_hidden_reset() {
    _str_builder_get 'reset:hidden' \
        || return ${?}
}


#
# reset hidden style to default
#
# @return int
#

function out_hidden_reset() {
    _str_builder_out '' 'reset:hidden' \
        && _auto_nl \
        || return ${?}
}
