ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

VERSION.MK.MASTER = version.mk
VERSION.MK.MASTER.DIR = ..
VERSION.MK.INCLUDE = namd.version.mk
include $(VERSION.MK.INCLUDE)

NAME           = namdGaMD-tcl-$(COMPILERNAME)
VERSION        = $(TCLVER)

SOURCE_NAME    = tcl
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(TCLVER)
SOURCE_PKG     = $(SOURCE_NAME)$(SOURCE_VERSION)-src.$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%-src.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)
