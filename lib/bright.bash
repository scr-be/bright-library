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
# source core variables and functions
#
source "${_BRIGHT_DIR_PATH}_bright-core_variables.bash"
source "${_BRIGHT_DIR_PATH}_bright-core_internal.bash"

#
# include builds functions
#
source "${_BRIGHT_DIR_PATH}_bright-apis_builds.bash"

#
# include styles functions
#
source "${_BRIGHT_DIR_PATH}_bright-apis_styles-reset.bash"
source "${_BRIGHT_DIR_PATH}_bright-apis_styles-setup.bash"

#
# include color functions
#
source "${_BRIGHT_DIR_PATH}_bright-apis_colors-fg.bash"
source "${_BRIGHT_DIR_PATH}_bright-apis_colors-bg.bash"
