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
# output control string with default forground
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_default_fg()
{
    _bright_str_builder_assign "fg:default ${2:-}"
    return $?
}

#
# output string with default forground
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_default_fg()
{
    _bright_str_builder_output "$1" "fg:default ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with black foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_black()
{
    _bright_str_builder_assign "fg:black ${2:-}"
    return $?
}

#
# output string with black foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_black()
{
    _bright_str_builder_output "$1" "fg:black ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with red foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_red()
{
    _bright_str_builder_assign "fg:red ${2:-}"
    return $?
}

#
# output string with red foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_red()
{
    _bright_str_builder_output "$1" "fg:red ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with green foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_green()
{
    _bright_str_builder_assign "fg:green ${2:-}"
    return $?
}

#
# output string with green foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_green()
{
    _bright_str_builder_output "$1" "fg:green ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with yellow foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_yellow()
{
    _bright_str_builder_assign "fg:yellow ${2:-}"
    return $?
}

#
# output string with yellow foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_yellow()
{
    _bright_str_builder_output "$1" "fg:yellow ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with blue foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_blue()
{
    _bright_str_builder_assign "fg:blue ${2:-}"
    return $?
}

#
# output string with blue foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_blue()
{
    _bright_str_builder_output "$1" "fg:blue ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with magenta foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_magenta()
{
    _bright_str_builder_assign "fg:magenta ${2:-}"
    return $?
}

#
# output string with magenta foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_magenta()
{
    _bright_str_builder_output "$1" "fg:magenta ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with cyan foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_cyan()
{
    _bright_str_builder_assign "fg:cyan ${2:-}"
    return $?
}

#
# output string with cyan foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_cyan()
{
    _bright_str_builder_output "$1" "fg:cyan ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with white foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_white()
{
    _bright_str_builder_assign "fg:white ${2:-}"
    return $?
}

#
# output string with white foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_white()
{
    _bright_str_builder_output "$1" "fg:white ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with black foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_light_black()
{
    _bright_str_builder_assign "fg:light-black ${2:-}"
    return $?
}

#
# output string with black foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_light_black()
{
    _bright_str_builder_output "$1" "fg:light-black ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with red foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_light_red()
{
    _bright_str_builder_assign "fg:light-red ${2:-}"
    return $?
}

#
# output string with red foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_light_red()
{
    _bright_str_builder_output "$1" "fg:light-red ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with green foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_light_green()
{
    _bright_str_builder_assign "fg:light-green ${2:-}"
    return $?
}

#
# output string with green foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_light_green()
{
    _bright_str_builder_output "$1" "fg:light-green ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with yellow foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_light_yellow()
{
    _bright_str_builder_assign "fg:light-yellow ${2:-}"
    return $?
}

#
# output string with yellow foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_light_yellow()
{
    _bright_str_builder_output "$1" "fg:light-yellow ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with blue foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_light_blue()
{
    _bright_str_builder_assign "fg:light-blue ${2:-}"
    return $?
}

#
# output string with blue foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_light_blue()
{
    _bright_str_builder_output "$1" "fg:light-blue ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with magenta foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_light_magenta()
{
    _bright_str_builder_assign "fg:light-magenta ${2:-}"
    return $?
}

#
# output string with magenta foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_light_magenta()
{
    _bright_str_builder_output "$1" "fg:light-magenta ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with cyan foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_light_cyan()
{
    _bright_str_builder_assign "fg:light-cyan ${2:-}"
    return $?
}

#
# output string with cyan foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_light_cyan()
{
    _bright_str_builder_output "$1" "fg:light-cyan ${2:-}"
    _bright_auto_newline
    return $?
}

#
# output control string with white foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_light_white()
{
    _bright_str_builder_assign "fg:light-white ${2:-}"
    return $?
}

#
# output string with white foreground styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function out_light_white()
{
    _bright_str_builder_output "$1" "fg:light-white ${2:-}"
    _bright_auto_newline
    return $?
}
