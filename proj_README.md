# Project python_proj

Python project with CI/CD setup.

Using `tox`, `pytest`, `flake8`, `mypy`,  and `GitHub Actions` workflows.
Using `make` as build system

---

NOTE: Update project url and make sure the `Tests` tag is the same as `name: Tests` in `./.github/workflows/main.yaml`

[![Tests](https://github.com/<profile>/<project>/workflows/main/badge.svg)](https://github.com/<profile>/<project>/actions/workflows/main.yaml)

---

## Prerequisites

Install the following tools:
- make
- Python 3.10+

# Project Setup

Install the application dependencies

```shell
$ make init
```

or run `make help` for more options

```shell
$ make help 
Usage:
  make <target> [args...]

Targets:
  help        Show this message
  init        Install package and its dependencies
  run         Run example
  clean       Clean virtual environment
  package     Package the project into .zip file
```

## Local Development

You can run `pytest`, `flake8` or `mypy` from the command line...

```shell
$ pytest

tests\test_main.py .
[100%]

---------- coverage: platform linux, python 3.11.3-final-0 -----------
Name                          Stmts   Miss  Cover
-------------------------------------------------
src/python_proj/__init__.py       0      0   100%
src/python_proj/main.py           4      1    75%
-------------------------------------------------
TOTAL                             4      1    75%


========================================================================= 1 passed in 0.03s ===
```

```shell
$ mypy src
Success: no issues found in 2 source files
```

```shell
$ flake8 src
0
```

.. or all at once, with `tox`

```shell
$ tox -e py311,mypy,flake8
...
  py311: OK (3.19=setup[2.90]+cmd[0.29] seconds)
  mypy: OK (2.71=setup[2.59]+cmd[0.12] seconds)
  flake8: OK (2.64=setup[2.50]+cmd[0.14] seconds)
  congratulations :) (8.71 seconds)
```

NOTE: change 'py311' based on your python version).

## GitHub Actions

Create [GitHub](https://github.com) repo and push your changes. This will trigger the CI/CD pipeline.

For more information see the GitHub Actions  [documentation](https://docs.github.com/en/actions/using-workflows).
