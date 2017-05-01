#!/bin/bash

##
# This file is part of the `bright-library` package.
#
# (c) Rob Frawley 2nd <rmf@src.run>
#
# For the full copyright and license information, view the LICENSE.md
# file distributed with this source code.
##

#
# configuration variables
#
BRIGHT_AUTO_NL=1
BRIGHT_AUTO_RESET=1

#
# internal variables
#
readonly SELF_DIR_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

#
# internal functions
#
source "${SELF_DIR_PATH}bright-internal.bash"

#
# output control string with custom formatting
#
# @param string $1 controls to apply
#
# @return int
#
function set_custom() {
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
function out_custom() {
    _bright_str_builder_output "$1" "$2"
    _bright_out_newline
    return $?
}

##
## RESET
##

#
# reset all fg/bg colors and styles to default
#
# @return int
#
function reset_all() {
    _bright_str_builder_assign "reset:all"
    return $?
}

#
# reset bold style to default
#
# @return int
#
function reset_bold() {
    _bright_str_builder_assign "reset:bold"
    return $?
}

#
# reset bright style to default
#
# @return int
#
function reset_bright() {
    _bright_str_builder_assign "reset:bright"
    return $?
}

#
# reset dim style to default
#
# @return int
#
function reset_dim() {
    _bright_str_builder_assign "reset:dim"
    return $?
}

#
# reset underline style to default
#
# @return int
#
function reset_underline() {
    _bright_str_builder_assign "reset:underline"
    return $?
}

#
# reset blink style to default
#
# @return int
#
function reset_blink() {
    _bright_str_builder_assign "reset:blink"
    return $?
}

#
# reset reverse style to default
#
# @return int
#
function reset_reverse() {
    _bright_str_builder_assign "reset:reverse"
    return $?
}

#
# reset hidden style to default
#
# @return int
#
function reset_hidden() {
    _bright_str_builder_assign "reset:hidden"
    return $?
}

##
## STYLES
##

#
# output control string with bold styled formatting
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_bold() {
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
function out_bold() {
    _bright_str_builder_output "$1" "style:bold ${2:-}"
    _bright_out_newline
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
function set_bright() {
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
function out_bright() {
    _bright_str_builder_output "$1" "style:bright ${2:-}"
    _bright_out_newline
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
function set_dim() {
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
function out_dim() {
    _bright_str_builder_output "$1" "style:dim ${2:-}"
    _bright_out_newline
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
function set_underline() {
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
function out_underline() {
    _bright_str_builder_output "$1" "style:underline ${2:-}"
    _bright_out_newline
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
function set_blink() {
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
function out_blink() {
    _bright_str_builder_output "$1" "style:blink ${2:-}"
    _bright_out_newline
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
function set_reverse() {
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
function out_reverse() {
    _bright_str_builder_output "$1" "style:reverse ${2:-}"
    _bright_out_newline
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
function set_hidden() {
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
function out_hidden() {
    _bright_str_builder_output "$1" "style:hidden ${2:-}"
    _bright_out_newline
    return $?
}

##
## FOREGROUND COLORS
##

#
# output control string with default forground
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_default_fg() {
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
function out_default_fg() {
    _bright_str_builder_output "$1" "fg:default ${2:-}"
    _bright_out_newline
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
function set_black() {
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
function out_black() {
    _bright_str_builder_output "$1" "fg:black ${2:-}"
    _bright_out_newline
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
function set_red() {
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
function out_red() {
    _bright_str_builder_output "$1" "fg:red ${2:-}"
    _bright_out_newline
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
function set_green() {
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
function out_green() {
    _bright_str_builder_output "$1" "fg:green ${2:-}"
    _bright_out_newline
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
function set_yellow() {
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
function out_yellow() {
    _bright_str_builder_output "$1" "fg:yellow ${2:-}"
    _bright_out_newline
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
function set_blue() {
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
function out_blue() {
    _bright_str_builder_output "$1" "fg:blue ${2:-}"
    _bright_out_newline
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
function set_magenta() {
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
function out_magenta() {
    _bright_str_builder_output "$1" "fg:magenta ${2:-}"
    _bright_out_newline
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
function set_cyan() {
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
function out_cyan() {
    _bright_str_builder_output "$1" "fg:cyan ${2:-}"
    _bright_out_newline
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
function set_white() {
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
function out_white() {
    _bright_str_builder_output "$1" "fg:white ${2:-}"
    _bright_out_newline
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
function set_light_black() {
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
function out_light_black() {
    _bright_str_builder_output "$1" "fg:light-black ${2:-}"
    _bright_out_newline
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
function set_light_red() {
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
function out_light_red() {
    _bright_str_builder_output "$1" "fg:light-red ${2:-}"
    _bright_out_newline
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
function set_light_green() {
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
function out_light_green() {
    _bright_str_builder_output "$1" "fg:light-green ${2:-}"
    _bright_out_newline
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
function set_light_yellow() {
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
function out_light_yellow() {
    _bright_str_builder_output "$1" "fg:light-yellow ${2:-}"
    _bright_out_newline
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
function set_light_blue() {
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
function out_light_blue() {
    _bright_str_builder_output "$1" "fg:light-blue ${2:-}"
    _bright_out_newline
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
function set_light_magenta() {
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
function out_light_magenta() {
    _bright_str_builder_output "$1" "fg:light-magenta ${2:-}"
    _bright_out_newline
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
function set_light_cyan() {
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
function out_light_cyan() {
    _bright_str_builder_output "$1" "fg:light-cyan ${2:-}"
    _bright_out_newline
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
function set_light_white() {
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
function out_light_white() {
    _bright_str_builder_output "$1" "fg:light-white ${2:-}"
    _bright_out_newline
    return $?
}

##
## BACKGROUND COLORS
##

#
# output control string with default forground
#
# @param string      $1 string to output
# @param string|null $2 additional controls to apply
#
# @return int
#
function set_bg_default() {
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
function out_bg_default() {
    _bright_str_builder_output "$1" "bg:default ${2:-}"
    _bright_out_newline
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
function set_bg_black() {
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
function out_bg_black() {
    _bright_str_builder_output "$1" "bg:black ${2:-}"
    _bright_out_newline
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
function set_bg_red() {
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
function out_bg_red() {
    _bright_str_builder_output "$1" "bg:red ${2:-}"
    _bright_out_newline
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
function set_bg_green() {
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
function out_bg_green() {
    _bright_str_builder_output "$1" "bg:green ${2:-}"
    _bright_out_newline
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
function set_bg_yellow() {
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
function out_bg_yellow() {
    _bright_str_builder_output "$1" "bg:yellow ${2:-}"
    _bright_out_newline
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
function set_bg_blue() {
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
function out_bg_blue() {
    _bright_str_builder_output "$1" "bg:blue ${2:-}"
    _bright_out_newline
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
function set_bg_magenta() {
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
function out_bg_magenta() {
    _bright_str_builder_output "$1" "bg:magenta ${2:-}"
    _bright_out_newline
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
function set_bg_cyan() {
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
function out_bg_cyan() {
    _bright_str_builder_output "$1" "bg:cyan ${2:-}"
    _bright_out_newline
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
function set_bg_white() {
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
function out_bg_white() {
    _bright_str_builder_output "$1" "bg:white ${2:-}"
    _bright_out_newline
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
function set_bg_light_black() {
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
function out_bg_light_black() {
    _bright_str_builder_output "$1" "bg:light-black ${2:-}"
    _bright_out_newline
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
function set_bg_light_red() {
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
function out_bg_light_red() {
    _bright_str_builder_output "$1" "bg:light-red ${2:-}"
    _bright_out_newline
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
function set_bg_light_green() {
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
function out_bg_light_green() {
    _bright_str_builder_output "$1" "bg:light-green ${2:-}"
    _bright_out_newline
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
function set_bg_light_yellow() {
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
function out_bg_light_yellow() {
    _bright_str_builder_output "$1" "bg:light-yellow ${2:-}"
    _bright_out_newline
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
function set_bg_light_blue() {
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
function out_bg_light_blue() {
    _bright_str_builder_output "$1" "bg:light-blue ${2:-}"
    _bright_out_newline
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
function set_bg_light_magenta() {
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
function out_bg_light_magenta() {
    _bright_str_builder_output "$1" "bg:light-magenta ${2:-}"
    _bright_out_newline
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
function set_bg_light_cyan() {
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
function out_bg_light_cyan() {
    _bright_str_builder_output "$1" "bg:light-cyan ${2:-}"
    _bright_out_newline
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
function set_bg_light_white() {
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
function out_bg_light_white() {
    _bright_str_builder_output "$1" "bg:light-white ${2:-}"
    _bright_out_newline
    return $?
}
