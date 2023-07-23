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
- Python 3.10

### Create project directory.

Download this repo and copy the `python_proj/` directory.

```console
$ git clone https://github.com/stanislavsabev/proj_setup.git
```

```console
cp -R proj_setup.git/python_proj <myproject>

cd <myproject>
```

Setup virtual environment and activate it.

```console
$ python -m venv .venv
```

- Linux / macOS

```console
$ source ./.venv/bin/activate
```

- Windows

```console
> .\.venv\Scripts\activate.bat
```

Install requirements.

```console
$ python -m pip install --upgrade pip
$ pip install -r requirements.txt
$ pip install -r requirements-dev.txt
```

### Install locally

Change the package name - optional, but recommended.

- Rename in `src/` directory.

```console
$ mv src/python_proj src/<myproject>
```

- Change all mentions of `python_proj` in 

```text
  pyproject.toml
  setup.cfg
  setup.py
  tests/test_start.py 
  example.py
```

Install as editable package

```bash
$ pip install -e .
```

## Local Usage

Run `pytest`, `flake8` and `mypy` from the command line...

```bash
$ pytest
...
tests\test_start.py .
[100%]

----------- coverage: platform win32, python 3.9.2-final-0 -----------
Name                             Stmts   Miss  Cover
----------------------------------------------------
src\python_proj\__init__.py       0      0   100%
src\python_proj\start.py          2      0   100%
----------------------------------------------------
TOTAL                                2      0   100%


========================================================================= 1 passed in 0.11s ===
```

```console
$ mypy src
Success: no issues found in 6 source files
```

```console
$ flake8 src tests
0
```

.. or all at once, with `tox`

```console
$ tox -e py37,mypy,flake8 # Change 'py37' based on your python version.
...
______________________________________________________________________________ summary ___
  py37: commands succeeded
  mypy: commands succeeded
  flake8: commands succeeded
  congratulations :)
```

## GitHub Actions

Create [GitHub](https://github.com) repo and push your changes. This will trigger the CI/CD pipeline.

For more information see the GitHub Actions  [documentation](https://docs.github.com/en/actions/using-workflows).
