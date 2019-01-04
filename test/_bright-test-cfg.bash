#!/bin/bash

##
## This file is part of the `src-run/bash-bright-library` package.
##
## (c) Rob Frawley 2nd <rmf@src.run>
##
## For the full copyright and license information, view the LICENSE.md
## file distributed with this source code.
##


#
# declare ANSI escape codes: style
#

declare -A _CODES_STYLE=(
    [bold]=1
    [bright]=1
    [dim]=2
    [underline]=4
    [blink]=5
    [reverse]=7
    [hidden]=8
)


#
# declare ANSI escape codes: reset
#

declare -A _CODES_RESET=(
    [all]=0
    [bold]=21
    [bright]=21
    [dim]=22
    [underline]=24
    [blink]=25
    [reverse]=27
    [hidden]=28
)


#
# declare ANSI escape codes: foreground color
#

declare -A _CODES_COLOR_FOREGROUND=(
    [default]=39
    [black]=30
    [red]=31
    [green]=32
    [yellow]=33
    [blue]=34
    [magenta]=35
    [cyan]=36
    [white]=37
    [light-black]=90
    [light-red]=91
    [light-green]=92
    [light-yellow]=93
    [light-blue]=94
    [light-magenta]=95
    [light-cyan]=96
    [light-white]=97
)


#
# declare ANSI escape codes: background color
#

declare -A _CODES_COLOR_BACKGROUND=(
    [default]=49
    [black]=40
    [red]=41
    [green]=42
    [yellow]=43
    [blue]=44
    [magenta]=45
    [cyan]=46
    [white]=47
    [light-black]=100
    [light-red]=101
    [light-green]=102
    [light-yellow]=103
    [light-blue]=104
    [light-magenta]=105
    [light-cyan]=106
    [light-white]=107
)


#
# declare ANSI escape codes: insts (complex combinations)
#

declare -A _CODES_INSTS=(
    ["rgb-fg-pink @fg-rgb:244,66,173 @style:bold"]="\033[38;2;244;66;173;1mrgb-fg-pink"
    ["underlined-dim-reverse-bold-bg-black @fg:white @bg:black @style:dim @style:reverse @style:bold @style:underline"]="\033[37;40;2;7;1;4munderlined-dim-reverse-bold-bg-black"
    ["rgb-fg-and-bg-pinkish @fg-rgb:244,66,173 @bg-rgb:120,66,173 @style:bold"]="\033[38;2;244;66;173;48;2;120;66;173;1mrgb-fg-and-bg-pinkish"
)
