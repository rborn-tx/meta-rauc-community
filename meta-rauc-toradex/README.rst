This README file contains information on the contents of the meta-rauc-toradex layer.

Please see the corresponding sections below for details.

Dependencies
============

* URI: git://git.openembedded.org/openembedded-core
* URI: https://github.com/rauc/meta-rauc.git
* URI: https://github.com/torizon/meta-toradex-bsp-common

Patches
=======

Please submit any patches against the meta-rauc-toradex layer via GitHub
pull request on https://github.com/rauc/meta-rauc-community.

Maintainer: Drew Moseley <drew.moseley@toradex.com>

Disclaimer
==========

Note that this is just an example layer that shows a few possible configuration
options how RAUC can be used.
Actual requirements may differ from project to projects and will probably need
a much different RAUC/bootloader/system configuration.

Also note that this layer is for demo purpose only and does not care about
migratability between different layer revision.

I. Adding the meta-rauc-toradex layer to your build
=======================================================

Run 'bitbake-layers add-layer meta-rauc-toradex'

II. Build The Demo System
=========================

::

   $ source oe-init-build-env

Set the ``MACHINE`` to the model you intend to build for. E.g.::

   MACHINE = "verdin-imx8mm"

Add configuration required for meta-rauc-toradex to your local.conf::

   # Settings for meta-rauc-toradexk
   
   IMAGE_INSTALL:append = " rauc"
   IMAGE_FSTYPES:append = " ext4"
   WKS_FILE = "sdimage-dual-toradex.wks.in"

Make sure either your distro (recommended) or your local.conf have ``rauc``
``DISTRO_FEATURE`` enabled::

   DISTRO_FEATURES:append = " rauc"

Build the minimal system image::

   $ bitbake core-image-minimal

III. Flash & Run The Demo System
================================

Use the [Toradex Easy Installer](https://www.toradex.com/tools-libraries/toradex-easy-installer) to flash the system.

Then power-on the board and log in.
To see that RAUC is configured correctly and can interact with the bootloader,
run::

  # rauc status

IV. Build and Install The Demo Bundle
=====================================

To build the bundle, run::

  $ bitbake update-bundle

Copy the generated bundle to the target system via nc, scp or an attached USB stick.

On the target, you can then install the bundle::

  # rauc install /path/to/bundle.raucb
