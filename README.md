# Python project

Template for python project with CI/CD setup.

Using `tox`, `pytest`, `flake8`, `mypy`,  and `GitHub Actions` workflows.
Using `make` to automate tasks system

---

NOTE: Update project url and make sure the `Tests` tag is the same as `name: Tests` in `./.github/workflows/tests.yaml`

[![Tests](https://github.com/<profile>/<project>/workflows/tests/badge.svg)](https://github.com/<profile>/<project>/actions/workflows/tests.yaml)

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

Rename the project:

```shell
$ make proj <your-proj-name>

Creaate directory <your-proj-name> and copy project files
Creaate git repository for <your-proj-name>
Initialized empty Git repository in /home/tt/projects/proj_setup/<your-proj-name>/.git/
Replace project name with <your-proj-name> in all files
Successfully creaated project <your-proj-name>
```

### Create new .git repo and update README (Optional)

Go to the new project dir and create a git commit:

```shell
$ cd ../<your-proj-dir>
$ git add --all
$ git commit -m "Initial commit"
```

Update the `README.md` file


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

```shell
$ mypy src
Success: no issues found in 2 source files
```

```shell
$ flake8 src
0
```

.. or all at once, with `tox` (change 'py311' based on your python version).
```shell
$ tox -e py311,mypy,flake8
...
  py311: OK (3.19=setup[2.90]+cmd[0.29] seconds)
  mypy: OK (2.71=setup[2.59]+cmd[0.12] seconds)
  flake8: OK (2.64=setup[2.50]+cmd[0.14] seconds)
  congratulations :) (8.71 seconds)
```

## GitHub Actions

Create [GitHub](https://github.com) repo and push your changes. This will trigger the CI/CD pipeline.

For more information see the GitHub Actions  [documentation](https://docs.github.com/en/actions/using-workflows).
