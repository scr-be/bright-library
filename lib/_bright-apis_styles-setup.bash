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
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_bold()
{
    _bright_str_builder_assign "style:bold ${2:-}"
    return $?
}

#
# output string with bold styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_bold()
{
    _bright_str_builder_output "$1" "style:bold ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with bright styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_bright()
{
    _bright_str_builder_assign "style:bright ${2:-}"
    return $?
}

#
# output string with bright styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_bright()
{
    _bright_str_builder_output "$1" "style:bright ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with dim styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_dim()
{
    _bright_str_builder_assign "style:dim ${2:-}"
    return $?
}

#
# output string with dim styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_dim()
{
    _bright_str_builder_output "$1" "style:dim ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with underline styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_underline()
{
    _bright_str_builder_assign "style:underline ${2:-}"
    return $?
}

#
# output string with underline styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_underline()
{
    _bright_str_builder_output "$1" "style:underline ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with blink styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_blink()
{
    _bright_str_builder_assign "style:blink ${2:-}"
    return $?
}

#
# output string with blink styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_blink()
{
    _bright_str_builder_output "$1" "style:blink ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with reverse styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_reverse()
{
    _bright_str_builder_assign "style:reverse ${2:-}"
    return $?
}

#
# output string with reverse styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_reverse()
{
    _bright_str_builder_output "$1" "style:reverse ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with hidden styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_hidden()
{
    _bright_str_builder_assign "style:hidden ${2:-}"
    return $?
}

#
# output string with hidden styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_hidden()
{
    _bright_str_builder_output "$1" "style:hidden ${2:-}"
    _bright_auto_newline
    return $?
}
