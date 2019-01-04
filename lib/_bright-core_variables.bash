#!/bin/bash

##
## This file is part of the `src-run/bash-bright-library` package.
##
## (c) Rob Frawley 2nd <rmf@src.run>
##
## For the full copyright and license information, view the LICENSE.md
## file distributed with this source code.
##

# SC2034: Detection of unused variables.
# shellcheck disable=SC2034


#
# Toggles whether styles that are output are automatically "reset" (or closed)
# after outputting the requested string (for example, when calling out_custom
# should the styles be reset after the styled string is output, or should no
# reset codes be output, allowing for subsequently any output to have the same
# styling as the compiled string).
#

_BRIGHT_AUTO_RESETS=1


#
# Toggles whether newlines should be written following any compiled bright
# output (for example, from calling out_custom or another function that takes
# a given string and applies styling before outputting it).
#

_BRIGHT_AUTO_RETURN=0


#
# Toggles whether internal exceptions display their respective error messages
# or simply return with a non-zero code. This setting does not affect the logic
# flow that may result from errors occurring, but does stop any error messages
# from being displayed to the user.
#

_BRIGHT_HIDE_ERRORS=0
