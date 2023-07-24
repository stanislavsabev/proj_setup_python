# Python project template

Template for python project with CI/CD setup.

Using `tox`, `pytest`, `flake8`, `mypy`,  and `GitHub Actions` workflows.
Using `make` to automate tasks system

---

# Project Setup

## Prerequisites

Install the following tools:
- make
- Python 3.10+

## Clone this repository

```shell
$ git clone https://github.com/stanislavsabev/proj_setup_python.git
```
## Create new project from this template

Run `make proj <your-proj-name>`. This will create a new python project with the chosen name in the same directory as this repository.


```shell
$ make proj <your-proj-name>

Creaate directory <your-proj-name> and copy project files
Creaate git repository for <your-proj-name>
Replace project name with <your-proj-name> in all files
Successfully creaated project <your-proj-name>
```

Opne the new project, checkout the README and use `make` to set it up.
Check

make init

```shell
$ cd ../<your-proj-name>
$ make help 
Usage:
  make <target> [args...]

Targets:
  help        Show this message
  init        Create virtual environment and install this package and its dependencies
  run         Run example
  clean       Clean virtual environment
  package     Package into .zip file
```
