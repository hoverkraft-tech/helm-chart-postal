LINTER_IMAGE ?= helm-chart-postal-linter:local
FILTER ?= $(or $(filter-out lint lint-fix,$(MAKECMDGOALS)),.*)

.DEFAULT_GOAL := help
.PHONY: help lint lint-fix

help: ## Display available commands
	@awk 'BEGIN {FS = ":.*## "} /^[a-zA-Z_-]+:.*## / {printf "%-18s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
lint: ## Run the repository lint checks (optional FILTER=regex)
	$(call run_linter,)

lint-fix: ## Apply supported automatic lint fixes (optional FILTER=regex)
	$(call run_linter, \
		-e FIX_BIOME_LINT=true \
		-e FIX_BIOME_FORMAT=true \
		-e FIX_MARKDOWN=true \
		-e FIX_MARKDOWN_PRETTIER=true \
		-e FIX_YAML_PRETTIER=true \
		-e FIX_NATURAL_LANGUAGE=true \
		-e FIX_SHELL_SHFMT=true \
		-e FIX_SPELL_CODESPELL=true \
	)

define run_linter
	@set -eu; \
	git_common_dir="$$(git rev-parse --path-format=absolute --git-common-dir)"; \
	docker build --platform linux/amd64 --target linter \
		--build-arg UID="$$(id -u)" --build-arg GID="$$(id -g)" \
		--tag "$(LINTER_IMAGE)" .; \
	docker run --platform linux/amd64 --rm \
		--volume "$(CURDIR):$(CURDIR)" \
		--volume "$$git_common_dir:$$git_common_dir:ro" \
		-e DEFAULT_WORKSPACE="$(CURDIR)" \
		-e FILTER_REGEX_INCLUDE="$(FILTER)" \
		$(1) \
		"$(LINTER_IMAGE)"
endef

# Allow the shared "make lint <pattern>" interface without hiding other target typos.
ifneq ($(filter lint lint-fix,$(MAKECMDGOALS)),)
%:
	@:
endif
