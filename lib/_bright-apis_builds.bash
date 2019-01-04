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
# write raw string with custom formatting visible
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _get() {
    _builder '@ctl:no-nl' '@ctl:no-reset' '@ctl:no-interpret' "${@}" \
        || return ${?}
}


#
# write string with custom formatting parsed
#
# @param string ...$1 any of: message, replacements, styles, colors, and controls
#
# @return int
#

function _out() {
    _builder '@ctl:auto-nl' '@ctl:auto-reset' '@ctl:interpret' "${@}" \
        || return ${?}
}
