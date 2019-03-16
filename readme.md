EFTCosmoMC
==========

This folder contains the EFTCAMB/EFTCosmoMC code.

### 1. EFTCAMB/EFTCosmoMC Requirements:

Compiling EFTCAMB/EFTCosmoMC requires a modern fortran compiler capable of handeling F2008 features.
These includes:

	ifort (tested with v>15.0)
	gcc/gfortran (tested with v>6.0)

To use other parts of the code, like the test or documentation parts other requirements have to be met.
These include a fully fledged python installation. We warmly suggest to install a
bundled package like (https://www.continuum.io/downloads).

A docker with all the required libraries is available at [dockerhub](https://hub.docker.com/r/eftcamb/eftbox/).

### 2. Installation procedure:

To compile the EFTCAMB/EFTCosmoMC codes issue the following command:

	make eftcosmomc
	
that will result in the executable program ``eftcosmomc`` that can be run like cosmomc.

On the first installation the build system will execute a script to install EFTCAMB and make sure that all EFTCAMB dependencies are properly installed.

### 3. Documentation:

We provide a set of notes that contain all the details and formulas of the EFTCAMB implementation:

* *EFTCAMB/EFTCosmoMC: Numerical Notes v2.0*
    Bin Hu, Marco Raveri, Noemi Frusciante, Alessandra Silvestri, [arXiv:1405.3590 [astro-ph.CO]](http://arxiv.org/abs/1405.3590)

### 4. Citing this work:

If you use the EFTCAMB/EFTCosmoMC package, please refer the original CAMB/CosmoMC paper and ours:

* *Effective Field Theory of Cosmic Acceleration: an implementation in CAMB*
    Bin Hu, Marco Raveri, Noemi Frusciante, Alessandra Silvestri,
    [arXiv:1312.5742 [astro-ph.CO]](http://arxiv.org/abs/1312.5742) [Phys.Rev. D89 (2014) 103530](http://journals.aps.org/prd/abstract/10.1103/PhysRevD.89.103530)


* *Effective Field Theory of Cosmic Acceleration: constraining dark energy with CMB data*
    Marco Raveri, Bin Hu, Noemi Frusciante, Alessandra Silvestri,
    [arXiv:1405.1022 [astro-ph.CO]](https://arxiv.org/abs/1405.1022) [Phys.Rev. D90 (2014) 043513](http://journals.aps.org/prd/abstract/10.1103/PhysRevD.90.043513)

This is the usual, fair way of giving credit to contributors to a
scientific result. In addition, it helps us justify our effort in
developing the EFTCAMB/EFTCosmoMC codes as an academic undertaking.

### 5. Licence Information:

EFTCAMB/EFTCosmoMC are a modification of the CAMB/CosmoMC codes.
The code part of CAMB/CosmoMC that is not modified is copyrighted by the CAMB/CosmoMC authors and released under their licence.

For the part of code that constitutes EFTCAMB/EFTCosmoMC see the LICENSE file in ``EFTCAMB/eftcamb/LICENSE`` and ``EFTCosmoMC/LICENSE``.

### 6. Build system target:

In addition to CosmoMC makefile targets EFTCosmoMC comes with the additional:

* ``eftcosmomc``: to compile EFTCosmoMC;
* ``eftcosmomc_debug``: to compile EFTCosmoMC in debug mode;
