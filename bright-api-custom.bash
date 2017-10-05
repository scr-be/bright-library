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
# output control string with custom formatting
#
# @param string $1 controls to apply
#
# @return int
#
function set_custom()
{
    _bright_str_builder_assign "$1"
    return $?
}

#
# output string with custom formatting
#
# @param string $1 string to output
# @param string $2 controls to apply
#
# @return int
#
function out_custom()
{
    _bright_str_builder_output "$1" "$2"
    _bright_out_newline
    return $?
}
