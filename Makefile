.PHONY:  package help
SHELL := /bin/bash
PROJ_NAME=python_proj


help: ## Show this message
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)


init: ## Setup Python venv, install package and its dependencies
	python -m venv .venv
	source .venv/bin/activate \
	&& python -m pip install --upgrade pip \
	&& pip install -r requirements-dev.txt


run: ## Run example
	source .venv/bin/activate \
	&& python -m example


clean: ## Clean Python venv
	rm -rf .venv


package: ## Package the project in .zip file
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
