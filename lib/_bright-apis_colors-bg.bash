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
function set_bg_default()
{
    _bright_str_builder_assign "bg:default ${2:-}"
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
function out_bg_default()
{
    _bright_str_builder_output "$1" "bg:default ${2:-}"
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
function set_bg_black()
{
    _bright_str_builder_assign "bg:black ${2:-}"
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
function out_bg_black()
{
    _bright_str_builder_output "$1" "bg:black ${2:-}"
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
function set_bg_red()
{
    _bright_str_builder_assign "bg:red ${2:-}"
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
function out_bg_red()
{
    _bright_str_builder_output "$1" "bg:red ${2:-}"
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
function set_bg_green()
{
    _bright_str_builder_assign "bg:green ${2:-}"
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
function out_bg_green()
{
    _bright_str_builder_output "$1" "bg:green ${2:-}"
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
function set_bg_yellow()
{
    _bright_str_builder_assign "bg:yellow ${2:-}"
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
function out_bg_yellow()
{
    _bright_str_builder_output "$1" "bg:yellow ${2:-}"
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
function set_bg_blue()
{
    _bright_str_builder_assign "bg:blue ${2:-}"
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
function out_bg_blue()
{
    _bright_str_builder_output "$1" "bg:blue ${2:-}"
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
function set_bg_magenta()
{
    _bright_str_builder_assign "bg:magenta ${2:-}"
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
function out_bg_magenta()
{
    _bright_str_builder_output "$1" "bg:magenta ${2:-}"
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
function set_bg_cyan()
{
    _bright_str_builder_assign "bg:cyan ${2:-}"
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
function out_bg_cyan()
{
    _bright_str_builder_output "$1" "bg:cyan ${2:-}"
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
function set_bg_white()
{
    _bright_str_builder_assign "bg:white ${2:-}"
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
function out_bg_white()
{
    _bright_str_builder_output "$1" "bg:white ${2:-}"
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
function set_bg_light_black()
{
    _bright_str_builder_assign "bg:light-black ${2:-}"
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
function out_bg_light_black()
{
    _bright_str_builder_output "$1" "bg:light-black ${2:-}"
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
function set_bg_light_red()
{
    _bright_str_builder_assign "bg:light-red ${2:-}"
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
function out_bg_light_red()
{
    _bright_str_builder_output "$1" "bg:light-red ${2:-}"
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
function set_bg_light_green()
{
    _bright_str_builder_assign "bg:light-green ${2:-}"
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
function out_bg_light_green()
{
    _bright_str_builder_output "$1" "bg:light-green ${2:-}"
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
function set_bg_light_yellow()
{
    _bright_str_builder_assign "bg:light-yellow ${2:-}"
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
function out_bg_light_yellow()
{
    _bright_str_builder_output "$1" "bg:light-yellow ${2:-}"
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
function set_bg_light_blue()
{
    _bright_str_builder_assign "bg:light-blue ${2:-}"
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
function out_bg_light_blue()
{
    _bright_str_builder_output "$1" "bg:light-blue ${2:-}"
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
function set_bg_light_magenta()
{
    _bright_str_builder_assign "bg:light-magenta ${2:-}"
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
function out_bg_light_magenta()
{
    _bright_str_builder_output "$1" "bg:light-magenta ${2:-}"
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
function set_bg_light_cyan()
{
    _bright_str_builder_assign "bg:light-cyan ${2:-}"
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
function out_bg_light_cyan()
{
    _bright_str_builder_output "$1" "bg:light-cyan ${2:-}"
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
function set_bg_light_white()
{
    _bright_str_builder_assign "bg:light-white ${2:-}"
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
function out_bg_light_white()
{
    _bright_str_builder_output "$1" "bg:light-white ${2:-}"
    _bright_auto_newline
    return $?
}
