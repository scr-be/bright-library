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
# create output control string with custom formatting
#
# @param string $1 controls to apply
#
# @return int
#

function _cmd() {
    _str_builder_get "${@}" \
        || return ${?}
}


#
# output string with custom formatting
#
# @param string $1 message to output
# @param string $2 command(s) to apply
#
# @return int
#

function _out() {
    _str_builder_out "${@}" \
        && _auto_nl \
        || return ${?}
}
