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
    local command="${1:-}"

    _bright_str_builder_assign "${command}"

    return $?
}

#
# output string with custom formatting
#
# @param string $1 message to output
# @param string $2 command(s) to apply
#
# @return int
#
function out_custom()
{
    local message="${1:-}"
    local command="${2:-}"

    _bright_str_builder_output "${message}" "${command}" \
        && _bright_auto_newline

    return $?
}
