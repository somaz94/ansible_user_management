.PHONY: help venv test create converge verify destroy lint clean

VENV := .venv
DISTRO ?= ubuntu2204

$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip
	$(VENV)/bin/pip install -r requirements.txt
	@touch $(VENV)/bin/activate

venv: $(VENV)/bin/activate ## Create virtual environment and install dependencies

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

test: venv ## Run full molecule test (create, converge, verify, destroy)
	MOLECULE_DISTRO=$(DISTRO) $(VENV)/bin/molecule test

create: venv ## Create molecule test instances
	MOLECULE_DISTRO=$(DISTRO) $(VENV)/bin/molecule create

converge: venv ## Run converge (apply role to instances)
	MOLECULE_DISTRO=$(DISTRO) $(VENV)/bin/molecule converge

verify: venv ## Run verification tests
	MOLECULE_DISTRO=$(DISTRO) $(VENV)/bin/molecule verify

destroy: venv ## Destroy molecule test instances
	MOLECULE_DISTRO=$(DISTRO) $(VENV)/bin/molecule destroy

lint: venv ## Run ansible-lint
	$(VENV)/bin/ansible-lint

clean: ## Remove build artifacts and virtual environment
	rm -rf $(VENV) .cache .molecule
