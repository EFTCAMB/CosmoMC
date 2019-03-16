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
# Makefile auxiliary file containing everything that we need for EFTCosmoMC
#

# start by passing a compile time flag to distinguish CAMB from EFTCAMB and allow to compile both.
ifeq ($(MAKECMDGOALS), eftcosmomc)
	FFLAGS+= -DEFTCOSMOMC
	DEBUGFLAGS+= -DEFTCOSMOMC
else

ifeq ($(MAKECMDGOALS), eftcosmomc_debug)
	FFLAGS+= -DEFTCOSMOMC
	DEBUGFLAGS+= -DEFTCOSMOMC
else
	FFLAGS+= -DSTDCAMB
	DEBUGFLAGS+= -DSTDCAMB
endif

endif

ifeq ($(MAKECMDGOALS), eftcosmomc_debug)
	FFLAGS=$(DEBUGFLAGS)
endif

# pass link flags:
ifeq ($(MAKECMDGOALS), eftcosmomc)
	F90FLAGS = $(FFLAGS) $(IFLAG)../EFTCAMB/$(OUTPUT_DIR) $(INCLUDE)
	LINKFLAGS = -L../EFTCAMB/$(OUTPUT_DIR) -lcamb_$(RECOMBINATION) $(LAPACKL) $(F90CRLINK) $(CLIKL)
	F90FLAGS += $(MODOUT) $(IFLAG)$(OUTPUT_DIR)/
endif
ifeq ($(MAKECMDGOALS), eftcosmomc_debug)
	F90FLAGS = $(FFLAGS) $(IFLAG)../EFTCAMB/$(OUTPUT_DIR) $(INCLUDE)
	LINKFLAGS = -L../EFTCAMB/$(OUTPUT_DIR) -lcamb_$(RECOMBINATION) $(LAPACKL) $(F90CRLINK) $(CLIKL)
	F90FLAGS += $(MODOUT) $(IFLAG)$(OUTPUT_DIR)/
endif

# general targets:

# main EFTCosmoMC target:
eftcosmomc: directories eftcamb $(OBJFILES)
	$(F90C) -o ../eftcosmomc $(OBJFILES) $(LINKFLAGS) $(F90FLAGS)

# debug eftcosmomc target:
eftcosmomc_debug: directories eftcamb $(OBJFILES)
	$(F90C) -o ../eftcosmomc_debug $(OBJFILES) $(LINKFLAGS) $(F90FLAGS)

# EFTCAMB target:
eftcamb:
	cd ../EFTCAMB && \
	$(MAKE) --file=Makefile_main libcamb OUTPUT_DIR=$(OUTPUT_DIR) \
	RECOMBINATION=$(RECOMBINATION) EQUATIONS=equations_EFT NONLINEAR=halofit_ppf

# clean targets:
clean: clean_eftcamb

clean_eftcamb:
	cd $(EFTCAMB_DIR) ; make clean
