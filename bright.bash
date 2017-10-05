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
# internal variables
#
readonly _BRIGHT_VERSION="master"
readonly _BRIGHT_DIR_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

#
# source includes
#
source "${_BRIGHT_DIR_PATH}bright-variables.bash"
source "${_BRIGHT_DIR_PATH}bright-internal.bash"
source "${_BRIGHT_DIR_PATH}bright-api-custom.bash"
source "${_BRIGHT_DIR_PATH}bright-api-reset.bash"
source "${_BRIGHT_DIR_PATH}bright-api-styles.bash"
source "${_BRIGHT_DIR_PATH}bright-api-colors-fg.bash"
source "${_BRIGHT_DIR_PATH}bright-api-colors-bg.bash"
