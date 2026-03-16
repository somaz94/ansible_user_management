DISTRO ?= ubuntu2204
VENV_DIR = .venv

.PHONY: venv test converge verify destroy lint clean

venv:
	python3 -m venv $(VENV_DIR)
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install ansible molecule molecule-plugins[docker] docker

test:
	MOLECULE_DISTRO=$(DISTRO) molecule test

converge:
	MOLECULE_DISTRO=$(DISTRO) molecule converge

verify:
	MOLECULE_DISTRO=$(DISTRO) molecule verify

destroy:
	molecule destroy

lint:
	ansible-lint .

clean:
	rm -rf $(VENV_DIR) .cache .molecule
