# Copyright 2016 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

VIRTUALENV=virtualenv
ENV=env
PIP = $(ENV)/bin/pip
PYTHON = $(ENV)/bin/python
COVERAGE = $(ENV)/bin/coverage
CODECOV = $(ENV)/bin/codecov


build:
	$(VIRTUALENV) $(ENV)
	$(PIP) install -e .
	$(PIP) install -e .[test]

test:
	$(COVERAGE) run -m testtools.run discover

codecov:
	$(CODECOV)


dist:
	$(PYTHON) setup.py egg_info -r sdist


clean:
	rm -rf daemonfixture.egg-info
	rm -rf dist


.PHONY: dist clean
