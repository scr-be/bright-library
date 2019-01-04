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
# escape all ANSI codes in passed text
#

_escapeAnsiCodes() {
    local text="${1}"

    sed 's/\\/\\\\/g' <<< "${text}"
}


#
# create basic (single) ANSI escape code sequence around passed text
#

_ansiCodeSequence() {
    local code="${1:-0}"
    local text="${2:-}"

    printf '%s%sm%s' '\033[' "${code}" "${text}"
}


#
# create
#

_ansiCodeTestExpectation() {
    local code="${1}"
    local opts="${2:-none}"
    local text="${3:-text}"

    _ansiCodeSequence "${code}" "${text}"

    case "${opts}" in
        auto )
            _ansiCodeSequence 0 '\n'
            ;;
    esac
}


#
# assert same ANSI value
#

_assertSameAnsi() {
    local testInst="${1}"
    local provided="${2}"
    local expected="${3}"

    assertSame \
        "$(
            printf \
                'instructions[%s] provided[%s] expected [%s]' \
                "${testInst}" \
                "${provided}" \
                "${expected}"
        )" \
        "${provided}" \
        "${expected}"
}


#
# assert same ANSI value: uninterpreted returns
#

_assertSameAnsiReturn() {
    local type="${1}"
    local name="${2}"
    local code="${3}"

    _assertSameAnsi \
        "${type}:${name}:${code}" \
        "$(_escapeAnsiCodes "$(_ansiCodeTestExpectation "${code}")")" \
        "$(_escapeAnsiCodes "$(_get 'text' "@${type}:${name}")")"
}


#
# assert same ANSI value: interpreted outputs
#

_assertSameAnsiOutput() {
    local type="${1}"
    local name="${2}"
    local code="${3}"

    _assertSameAnsi \
        "${type}:${name}:${code}" \
        "$(_escapeAnsiCodes "$(_ansiCodeTestExpectation "${code}" auto)")" \
        "$(_escapeAnsiCodes "$(_out '@ctl:no-interpret' 'text' "@${type}:${name}")")"
}
