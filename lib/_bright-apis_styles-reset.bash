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
# reset all fg/bg colors and styles to default
#
# @return int
#
function reset_all()
{
    _bright_str_builder_assign "reset:all"
    return $?
}

#
# reset bold style to default
#
# @return int
#
function reset_bold()
{
    _bright_str_builder_assign "reset:bold"
    return $?
}

#
# reset bright style to default
#
# @return int
#
function reset_bright()
{
    _bright_str_builder_assign "reset:bright"
    return $?
}

#
# reset dim style to default
#
# @return int
#
function reset_dim()
{
    _bright_str_builder_assign "reset:dim"
    return $?
}

#
# reset underline style to default
#
# @return int
#
function reset_underline()
{
    _bright_str_builder_assign "reset:underline"
    return $?
}

#
# reset blink style to default
#
# @return int
#
function reset_blink()
{
    _bright_str_builder_assign "reset:blink"
    return $?
}

#
# reset reverse style to default
#
# @return int
#
function reset_reverse()
{
    _bright_str_builder_assign "reset:reverse"
    return $?
}

#
# reset hidden style to default
#
# @return int
#
function reset_hidden()
{
    _bright_str_builder_assign "reset:hidden"
    return $?
}
