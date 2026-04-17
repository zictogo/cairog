nodist_noinst_SCRIPTS = pre-inst-env

GOBJECTS = $(SOURCES:%.scm=%.go)

moddir=$(prefix)/share/guile/site/$(GUILE_EFFECTIVE_VERSION)
godir=$(libdir)/guile/$(GUILE_EFFECTIVE_VERSION)/site-ccache

nobase_dist_mod_DATA = $(SOURCES)
nobase_go_DATA = $(GOBJECTS)

guile_install_go_files = install-nobase_goDATA
$(guile_install_go_files): install-nobase_dist_modDATA

SUFFIXES = .scm .go
.scm.go:
	$(AM_V_GEN)$(top_builddir)/pre-inst-env $(GUILE_TOOLS) compile \
	  $(GUILE_TARGET) -o "$@" "$<"

SOURCES = \
  cairog/core.scm    \
  cairog/types.scm   \
  cairog/surface.scm \
  cairog/context.scm

TEST_FILES = \
  tests/core-test.scm    \
  tests/surface-test.scm \
  tests/context-test.scm

.PHONY: check
check: $(GOBJECTS)
	@for f in $(TEST_FILES); do \
		echo "  $$f"; \
		$(top_builddir)/pre-inst-env $(GUILE) $$f || exit 1; \
	done

EXTRA_DIST = \
  README.md  \
  env.sh     \
  $(TEST_FILES)

CLEANFILES = $(GOBJECTS)
