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
    _builder_return 'reset:all' \
        || return ${?}
}


#
# reset all colors and styles
#
# @return int
#

function out_reset() {
    _builder_output '' 'reset:all' \
        && _auto_nl \
        || return ${?}
}


#
# reset bold style to default
#
# @return int
#

function cmd_bold_reset() {
    _builder_return 'reset:bold' \
        || return ${?}
}


#
# reset bold style to default
#
# @return int
#

function out_bold_reset() {
    _builder_output '' 'reset:bold' \
        && _auto_nl \
        || return ${?}
}


#
# reset bright style to default
#
# @return int
#

function cmd__reset() {
    _builder_return 'reset:bright' \
        || return ${?}
}


#
# reset bright style to default
#
# @return int
#

function out__reset() {
    _builder_output '' 'reset:bright' \
        && _auto_nl \
        || return ${?}
}


#
# reset dim style to default
#
# @return int
#

function cmd_dim_reset() {
    _builder_return 'reset:dim' \
        || return ${?}
}


#
# reset dim style to default
#
# @return int
#

function out_dim_reset() {
    _builder_output '' 'reset:dim' \
        && _auto_nl \
        || return ${?}
}


#
# reset underline style to default
#
# @return int
#

function cmd_underline_reset() {
    _builder_return 'reset:underline' \
        || return ${?}
}


#
# reset underline style to default
#
# @return int
#

function out_underline_reset() {
    _builder_output '' 'reset:underline' \
        && _auto_nl \
        || return ${?}
}


#
# reset blink style to default
#
# @return int
#

function cmd_blink_reset() {
    _builder_return 'reset:blink' \
        || return ${?}
}


#
# reset blink style to default
#
# @return int
#

function out_blink_reset() {
    _builder_output '' 'reset:blink' \
        && _auto_nl \
        || return ${?}
}


#
# reset reverse style to default
#
# @return int
#

function cmd_reverse_reset() {
    _builder_return 'reset:reverse' \
        || return ${?}
}


#
# reset reverse style to default
#
# @return int
#

function out_reverse_reset() {
    _builder_output '' 'reset:reverse' \
        && _auto_nl \
        || return ${?}
}


#
# reset hidden style to default
#
# @return int
#

function cmd_hidden_reset() {
    _builder_return 'reset:hidden' \
        || return ${?}
}


#
# reset hidden style to default
#
# @return int
#

function out_hidden_reset() {
    _builder_output '' 'reset:hidden' \
        && _auto_nl \
        || return ${?}
}
