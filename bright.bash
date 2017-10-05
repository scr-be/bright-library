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
source "${_BRIGHT_DIR_PATH}_bright-variables.bash"
source "${_BRIGHT_DIR_PATH}_bright-internal.bash"
source "${_BRIGHT_DIR_PATH}_bright-api-custom.bash"
source "${_BRIGHT_DIR_PATH}_bright-api-reset.bash"
source "${_BRIGHT_DIR_PATH}_bright-api-styles.bash"
source "${_BRIGHT_DIR_PATH}_bright-api-colors-fg.bash"
source "${_BRIGHT_DIR_PATH}_bright-api-colors-bg.bash"
