#----------------------------------------------------------------------------------------
#
# This file is part of EFTCosmoMC.
#
# Copyright (C) 2013-2017 by the EFTCosmoMC authors
#
# The EFTCosmoMC code is free software;
# You can use it, redistribute it, and/or modify it under the terms
# of the GNU General Public License as published by the Free Software Foundation;
# either version 3 of the License, or (at your option) any later version.
# The full text of the license can be found in the file EFTCAMB/eftcamb/LICENSE at
# the top level of the EFTCosmoMC distribution.
#
#----------------------------------------------------------------------------------------

#
# Script that initializes the EFTCAMB subrepository.
#
# Developed by: Marco Raveri (mraveri@uchicago.edu) for the EFTCAMB/EFTCosmoMC code
#

#!/bin/bash

# get the path of the script:
SCRIPT_PATH="`dirname \"$0\"`"                  # relative
SCRIPT_PATH="`( cd \"$SCRIPT_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$SCRIPT_PATH" ] ; then
  exit 1
fi

# define the EFTCAMB path:
EFTCAMB_DIR=$SCRIPT_PATH/../EFTCAMB

# check if the EFTCAMB directory is empty:
if test "$(ls -A "$EFTCAMB_DIR")"; then

	exit 0

else

	cd $SCRIPT_PATH/..
	git submodule init
	git submodule update

fi

exit 0
