SHELL := /bin/bash
PROJ_NAME=python_proj

# If the first argument is "rename"...
ifeq (rename,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY:  package help

help: ## Show this message
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target> [args...]\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)


rename: ## Rename this project. Args: <new-proj-name>
	@echo renaming project to: $(RUN_ARGS)
	@for f in $$(find . -name "*.py") Makefile README.md setup.cfg; \
		do \
		[ -f "$$f" ] && sed -i 's/$(PROJ_NAME)/$(RUN_ARGS)/g' $$f; \
	done


init: ## Install package and its dependencies into virtual environment
	python -m venv .venv
	source .venv/bin/activate \
	&& python -m pip install --upgrade pip \
	&& pip install -r requirements-dev.txt


run: ## Run example
	source .venv/bin/activate \
	&& python -m example


clean: ## Clean virtual environment
	rm -rf .venv


package: ## Package the project into .zip file
	rm -rf .$(PROJ_NAME)
	mkdir .$(PROJ_NAME)
	cp Makefile .$(PROJ_NAME)/
	cp LICENSE .$(PROJ_NAME)/
	cp pyproject.toml .$(PROJ_NAME)/
	cp requirements-dev.txt .$(PROJ_NAME)/
	cp requirements.txt .$(PROJ_NAME)/
	cp setup.cfg .$(PROJ_NAME)/
	cp tox.ini .$(PROJ_NAME)/
	find ./src/$(PACKAGE_NAME) -name '*.py' -exec cp --parents "{}" .$(PROJ_NAME)/ \;
	find ./tests/$(PACKAGE_NAME) -name '*.py' -exec cp --parents "{}" .$(PROJ_NAME)/ \;
	cd .$(PROJ_NAME) && zip -r ../$(PROJ_NAME).zip .
	rm -rf .$(PROJ_NAME)
