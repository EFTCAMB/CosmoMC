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
# Makefile auxiliary file containing the global EFTCosmoMC targets. This gets added to
# the Makefile in the main CosmoMC directory.
#

# init EFTCAMB targets:

# force execution of initialization before anything else:
eftcamb_initialized:=$(shell bash $(EFTCOSMOMC_DIR)/eftcosmomc_init.sh)

# EFTCosmoMC targets:

.PHONY: eftcosmomc

eftcosmomc: BUILD ?= MPI

eftcosmomc: ./source/*.*90 ./EFTCAMB/*.*90 ./EFTCAMB/*/*.*90 ./EFTCAMB/*/*/*.*90
	cd ./source && make eftcosmomc OUTPUT_DIR=ReleaseEFT BUILD=$(BUILD)

# EFTCosmoMC debug main targets:

.PHONY: eftcosmomc_debug

eftcosmomc_debug: BUILD ?= MPI

eftcosmomc_debug: ./source/*.*90 ./EFTCAMB/*.*90 ./EFTCAMB/*/*.*90 ./EFTCAMB/*/*/*.*90
	cd ./source && make eftcosmomc_debug OUTPUT_DIR=DebugEFT BUILD=$(BUILD)

# global targets:

all: eftcosmomc cosmomc getdist
default: eftcosmomc cosmomc
Debug: eftcosmomc_debug cosmomc_debug
Release: eftcosmomc cosmomc
rebuild: clean delete eftcosmomc cosmomc

# clean targets:

delete_eftcosmomc:
	rm -f eftcosmomc
	rm -f eftcosmomc_debug

delete: delete_eftcosmomc
