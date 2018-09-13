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
# resolve the real path to testing file
#

readonly _TEST_DIR_PATH="$(
    cd "$(dirname "$(realpath "${0}")")" && pwd
)"


#
# source bright library
#

. "${_TEST_DIR_PATH}/../bright.bash"


#
# testing ansi style control codes
#

testStyleControlCodes() {
    local -A codes=(
        [bold]=1
        [bright]=1
        [dim]=2
        [underline]=4
        [blink]=5
        [reverse]=7
        [hidden]=8
    )

    for name in "${!codes[@]}"; do
        assertSame \
            "\"${name}\" style ansi code of \"${codes[$name]}\"" \
            "\033[${codes[$name]}mtext" \
            "$(_cmd 'text' "@style:${name}")"
    done
}


#
# testing ansi reset control codes
#

testResetControlCodes() {
    local -A codes=(
        [all]=0
        [bold]=21
        [bright]=21
        [dim]=22
        [underline]=24
        [blink]=25
        [reverse]=27
        [hidden]=28
    )

    for name in "${!codes[@]}"; do
        assertSame \
            "\"${name}\" reset ansi code of \"${codes[$name]}\"" \
            "\033[${codes[$name]}mtext" \
            "$(_cmd 'text' "@reset:${name}")"
    done
}


#
# testing ansi fg color control codes
#

testFgColorControlCodes() {
    local -A codes=(
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

    for name in "${!codes[@]}"; do
        assertSame \
            "\"${name}\" reset ansi code of \"${codes[$name]}\"" \
            "\033[${codes[$name]}mtext" \
            "$(_cmd 'text' "@fg:${name}")"
    done
}


#
# testing ansi bg color control codes
#

testBgColorControlCodes() {
    local -A codes=(
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

    for name in "${!codes[@]}"; do
        assertSame \
            "\"${name}\" reset ansi code of \"${codes[$name]}\"" \
            "\033[${codes[$name]}mtext" \
            "$(_cmd 'text' "@bg:${name}")"
    done
}


#
# testing complex control codes
#

testComplexControlCodes() {
    local -A codes=(
        ["rgb-fg-pink @fg-rgb:244,66,173 @style:bold"]="\033[38;2;244;66;173;1mrgb-fg-pink"
        ["underlined-dim-reverse-bold-bg-black @fg:white @bg:black @style:dim @style:reverse @style:bold @style:underline"]="\033[37;40;2;7;1;4munderlined-dim-reverse-bold-bg-black"
        ["rgb-fg-and-bg-pinkish @fg-rgb:244,66,173 @bg-rgb:120,66,173 @style:bold"]="\033[38;2;244;66;173;48;2;120;66;173;1mrgb-fg-and-bg-pinkish"
    )

    for name in "${!codes[@]}"; do
        assertSame \
            "\"${name}\" ansi instructions \"${codes[$name]}\"" \
            "${codes[$name]}" \
            "$(_cmd ${name})"
    done
}


#
# source shunit2 testing framework
#

. "${_TEST_DIR_PATH}/.shunit/shunit2"
