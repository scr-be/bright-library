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
# bright release name and id
#

readonly _BRIGHT_RELEASE_NAME="alternatively-applied-system"
readonly _BRIGHT_RELEASE_ID="2.0.0"


#
# bright directory path for includes
#

readonly _BRIGHT_DIR_PATH="$(
    cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")" && pwd
)"


#
# source core variables and functions
#

# shellcheck source=lib/_bright-core_variables.bash
source "${_BRIGHT_DIR_PATH}/_bright-core_variables.bash"

# shellcheck source=lib/_bright-core_functions.bash
source "${_BRIGHT_DIR_PATH}/_bright-core_functions.bash"


#
# include builds functions
#

# shellcheck source=lib/_bright-apis_builds.bash
source "${_BRIGHT_DIR_PATH}/_bright-apis_builds.bash"


#
# include styles functions
#

# shellcheck source=lib/_bright-apis_styles-reset.bash
source "${_BRIGHT_DIR_PATH}/_bright-apis_styles-reset.bash"

# shellcheck source=lib/_bright-apis_styles-setup.bash
source "${_BRIGHT_DIR_PATH}/_bright-apis_styles-setup.bash"


#
# include color functions
#

# shellcheck source=lib/_bright-apis_colors-foreground.bash
source "${_BRIGHT_DIR_PATH}/_bright-apis_colors-foreground.bash"

# shellcheck source=lib/_bright-apis_colors-background.bash
source "${_BRIGHT_DIR_PATH}/_bright-apis_colors-background.bash"
