AUTOFLAKE_OPTS := --remove-all-unused-imports --remove-unused-variables --ignore-init-module-imports --recursive --in-place
SOURCES := python_package tests

.PHONY: prepare
prepare:
	pip install pipenv
	pipenv install --dev

.PHONY: lint
lint:
	autoflake $(AUTOFLAKE_OPTS) --check $(SOURCES)
	black --check $(SOURCES)
	isort --recursive --check-only $(SOURCES)

.PHONY: format
format:
	autoflake $(AUTOFLAKE_OPTS) $(SOURCES)
	black $(SOURCES)
	isort --recursive $(SOURCES)

.PHONY: test
test:
	pytest tests
