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
# include the library to be tested: bright library
#

# shellcheck source=bright.bash
source "${_TEST_ROOT_PATH:-.}/../bright.bash"


#
# bright library configuration: enable auto escape code resets and newlines
#

_BRIGHT_AUTO_RESETS=1
_BRIGHT_AUTO_RETURN=1
