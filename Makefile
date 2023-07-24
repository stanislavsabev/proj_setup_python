 SHELL := /bin/bash
PROJ_NAME=python_proj

# If the first argument is "rename"...
ifeq (proj,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: package help

help: ## Show this message
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target> [args...]\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

proj: create_dir replace_name ## Create new project from this one. ARGS: <new-proj-name>
	@printf "Successfully creaated project \033[36m$(RUN_ARGS)\033[0m\n"

create_dir:
	@printf "Creaate directory \033[36m$(RUN_ARGS)\033[0m and copy project files\n"
	@rm -rf ../$(RUN_ARGS)
	@mkdir ../$(RUN_ARGS)
	@rsync -aq . ../$(RUN_ARGS) --exclude .git --exclude Makefile --exclude README.md
	@mv ../$(RUN_ARGS)/proj_Makefile ../$(RUN_ARGS)/Makefile
	@mv ../$(RUN_ARGS)/proj_README.md ../$(RUN_ARGS)/README.md

replace_name:
	@printf "Replace project name with \033[36m$(RUN_ARGS)\033[0m in all files\n"
	@cd ../$(RUN_ARGS) && \
		mv src/$(PROJ_NAME) src/$(RUN_ARGS) && \
		for f in $$(find . -name "*.py") \
			Makefile README.md setup.cfg project.toml tox.ini; \
		do \
			[ -f "$$f" ] && sed -i 's/$(PROJ_NAME)/$(RUN_ARGS)/g' $$f; \
		done && \
		git add --all

init: ## Create virtual environment and install this package and its dependencies
	python -m venv .venv
	source .venv/bin/activate \
	&& python -m pip install --upgrade pip \
	&& pip install -r requirements-dev.txt \
	&& pip install -e .

run: ## Run example
	source .venv/bin/activate \
	&& python -m example

clean: ## Clean virtual environment
	rm -rf .venv
	rm -rf src/$(PROJ_NAME).egg-info
	find . -name "__pycache__" -type d -exec rm -rf {} +
	find . -name ".pytest_cache" -type d -exec rm -rf {} +

package: ## Package into .zip file
	rm -rf .$(PROJ_NAME)
	mkdir .$(PROJ_NAME)
	cp Makefile .$(PROJ_NAME)/
	cp LICENSE .$(PROJ_NAME)/
	cp README.md .$(PROJ_NAME)/
	cp pyproject.toml .$(PROJ_NAME)/
	cp requirements-dev.txt .$(PROJ_NAME)/
	cp requirements.txt .$(PROJ_NAME)/
	cp setup.cfg .$(PROJ_NAME)/
	cp tox.ini .$(PROJ_NAME)/
	find ./src/$(PACKAGE_NAME) -name '*.py' -exec cp --parents "{}" .$(PROJ_NAME)/ \;
	find ./tests/$(PACKAGE_NAME) -name '*.py' -exec cp --parents "{}" .$(PROJ_NAME)/ \;
	cd .$(PROJ_NAME) && zip -r ../$(PROJ_NAME).zip .
	rm -rf .$(PROJ_NAME)
