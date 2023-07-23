# Python project

Template for python CI/CD project setup.

Using `tox`, `pytest`, `flake8`, `mypy`,  and `GitHub Actions` workflows.
Using `make` as build system

---

NOTE: Update project url and make sure the `Tests` tag is the same as `name: Tests` in `./.github/workflows/tests.yaml`

[![Tests](https://github.com/<profile>/<project>/workflows/tests/badge.svg)](https://github.com/<profile>/<project>/actions/workflows/tests.yaml)

---

# Project Setup

## Prerequisites

Install the following tools:
- make
- Python 3.10+

## Clone and rename the project

```shell
$ git clone https://github.com/stanislavsabev/proj_setup_python.git \
<your_project_name>

$ cd <your_project_name>
```

Rename the project:

```shell
$ make rename <your-project-name>
```

Install the application dependencies:

```shell
$ make init
```

### Create new .git repo and update README (Optional)

Create new git repository:

```shell
$ rm -rf .git && git init
$ git add --all
$ git commit -m "Initial commit"
```
Update `README.md` (this file)


## Local Development

Run `pytest`, `flake8` and `mypy` from the command line...

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

```console
$ mypy src
Success: no issues found in 6 source files
```

```console
$ flake8 src tests
0
```

.. or all at once, with `tox` (change 'py311' based on your python version).
```console
$ tox -e py311,mypy,flake8
...
______________________________________________________________________________ summary ___
  py311: commands succeeded
  mypy: commands succeeded
  flake8: commands succeeded
  congratulations :)
```

## GitHub Actions

Create [GitHub](https://github.com) repo and push your changes. This will trigger the CI/CD pipeline.

For more information see the GitHub Actions  [documentation](https://docs.github.com/en/actions/using-workflows).
