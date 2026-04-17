GUILE    = guile
GUILE_FLAGS = -L .
TEST_DIR = tests

TEST_FILES = $(wildcard $(TEST_DIR)/*.scm)

.PHONY: test clean

test:
	@for f in $(TEST_FILES); do \
		echo "Running $$f ..."; \
		$(GUILE) $(GUILE_FLAGS) $$f || exit 1; \
	done

clean:
	@rm -f $(TEST_DIR)/*.log *.log
	@find . -path ./.git -prune -o -name "*.go" -print | xargs rm -f
