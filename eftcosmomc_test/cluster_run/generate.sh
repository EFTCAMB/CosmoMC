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

# go to the script folder:
cd $SCRIPT_PATH

# parameters directories:
PARAM_FOLDERS=( $(find $SCRIPT_PATH/../parameters -maxdepth 1 -type d -printf '%P\n') )

# cycle:
for folder in ${PARAM_FOLDERS[@]};
do

echo 'Doing parameters for:' $folder

rm -rf $folder
mkdir $folder

for file in $SCRIPT_PATH/../parameters/$folder/*.ini ;

do

	filename=$(basename "$file")
	extension="${filename##*.}"
	filename="${filename%.ini*}"

cat <<EOF > $folder/$filename.sbatch
#!/bin/bash
#SBATCH --job-name=$filename
#SBATCH --output=chains/$filename.out
#SBATCH --error=chains/$filename.err
#SBATCH --time=36:00:00
#SBATCH --partition=sandyb
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1
#SBATCH --exclusive

# prepare the environment:
source ~/environment/cosmomc.sh

mpirun -np 4 ./eftcosmomc parameters_run/parameters/$folder/$filename.ini

EOF

done;



done

exit
