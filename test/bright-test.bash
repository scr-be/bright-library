#!/bin/bash

##
## This file is part of the `src-run/bash-bright-library` package.
##
## (c) Rob Frawley 2nd <rmf@src.run>
##
## For the full copyright and license information, view the LICENSE.md
## file distributed with this source code.
##

# SC2086: Ignore warnings about missing double quotes to prevent word splitting. (intended)
# SC2155: Ignore warnings about separate declare/assign to not mask return values. (intended)
# shellcheck disable=SC2086
# shellcheck disable=SC2155


#
# resolve test root directory path
#

declare -r _TEST_ROOT_PATH="$(
    dirname "$(realpath -m "${BASH_SOURCE[0]}" 2> /dev/null)" 2> /dev/null
)"


#
# include test configuration, test subroutines, and the bright library itself
#

# shellcheck source=test/_bright-test-cfg.bash
source "${_TEST_ROOT_PATH:-.}/_bright-test-cfg.bash"

# shellcheck source=test/_bright-test-sub.bash
source "${_TEST_ROOT_PATH:-.}/_bright-test-sub.bash"

# shellcheck source=test/_bright-test-lib.bash
source "${_TEST_ROOT_PATH:-.}/_bright-test-lib.bash"


#
# test ANSI escape codes: style (uninterpreted return values)
#

test_return_style() {
    for key in "${!_CODES_STYLE[@]}"; do
        _assertSameAnsiReturn style "${key}" "${_CODES_STYLE[${key}]}"
    done
}


#
# test ANSI escape codes: style (interpreted output values)
#

test_output_style() {
    for key in "${!_CODES_STYLE[@]}"; do
        _assertSameAnsiOutput style "${key}" "${_CODES_STYLE[${key}]}"
    done
}


#
# test ANSI escape codes: reset (uninterpreted return values)
#

test_return_reset() {
    for key in "${!_CODES_RESET[@]}"; do
        _assertSameAnsiReturn reset "${key}" "${_CODES_RESET[${key}]}"
    done
}


#
# test ANSI escape codes: reset (interpreted output values)
#

test_output_reset() {
    for key in "${!_CODES_RESET[@]}"; do
        _assertSameAnsiOutput reset "${key}" "${_CODES_RESET[${key}]}"
    done
}


#
# test ANSI escape codes: foreground color (uninterpreted return values)
#

test_return_color_foreground() {
    for key in "${!_CODES_COLOR_FOREGROUND[@]}"; do
        _assertSameAnsiReturn fg "${key}" "${_CODES_COLOR_FOREGROUND[${key}]}"
    done
}


#
# test ANSI escape codes: foreground color (interpreted output values)
#

test_output_color_foreground() {
    for key in "${!_CODES_COLOR_FOREGROUND[@]}"; do
        _assertSameAnsiOutput fg "${key}" "${_CODES_COLOR_FOREGROUND[${key}]}"
    done
}


#
# test ANSI escape codes: background color (uninterpreted return values)
#

test_return_color_background() {
    for key in "${!_CODES_COLOR_BACKGROUND[@]}"; do
        _assertSameAnsiReturn bg "${key}" "${_CODES_COLOR_BACKGROUND[${key}]}"
    done
}


#
# test ANSI escape codes: background color (interpreted output values)
#

test_output_color_background() {
    for key in "${!_CODES_COLOR_BACKGROUND[@]}"; do
        _assertSameAnsiOutput bg "${key}" "${_CODES_COLOR_BACKGROUND[${key}]}"
    done
}


#
# test ANSI escape codes: complex instructions (uninterpreted return values)
#

test_return_insts() {
    for key in "${!_CODES_INSTS[@]}"; do
        _assertSameAnsi \
            "insts:${key}:${_CODES_INSTS[$key]}" \
            "$(_escapeAnsiCodes "${_CODES_INSTS[$key]}")" \
            "$(_escapeAnsiCodes "$(_get ${key})")"
    done
}


#
# test ANSI escape codes: complex instructions (interpreted output values)
#

test_output_insts() {
    for key in "${!_CODES_INSTS[@]}"; do
        _assertSameAnsi \
            "insts:${key}:${_CODES_INSTS[$key]}" \
            "$(_escapeAnsiCodes "${_CODES_INSTS[$key]}$(_ansiCodeSequence 0 '\n')")" \
            "$(_escapeAnsiCodes "$(_out '@ctl:no-interpret' ${key})")"
    done
}


#
# source testing framework runtime
#

# shellcheck disable=SC1090
source "${_TEST_ROOT_PATH}/.shunit/shunit2"
