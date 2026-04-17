dnl -*- Autoconf -*-

AC_INIT([cairog], [m4_esyscmd_s([cat VERSION])])
AC_CONFIG_SRCDIR(cairog/core.scm)
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([1.12 foreign silent-rules subdir-objects -Woverride -Wno-portability])

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([pre-inst-env], [chmod +x pre-inst-env])

dnl Find guile and guild; defines GUILE_EFFECTIVE_VERSION.
GUILE_PKG([3.0])
GUILE_PROGS
if test "x$GUILD" = "x"; then
   AC_MSG_ERROR(['guild' binary not found; please check your guile-3.x installation.])
fi

if test "$cross_compiling" != no; then
   GUILE_TARGET="--target=$host_alias"
   AC_SUBST([GUILE_TARGET])
fi

dnl Verify that libcairo is present (used at runtime via FFI).
PKG_CHECK_MODULES([CAIRO], [cairo >= 1.14], [],
  [AC_MSG_ERROR([libcairo >= 1.14 not found.  Install cairo-devel or libcairo2-dev.])])

AC_OUTPUT
