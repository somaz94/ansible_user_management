# Ansible User Management

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-somaz94.ansible__user__management-blue.svg)](https://galaxy.ansible.com/ui/standalone/roles/somaz94/ansible_user_management/)
[![Molecule Test](https://github.com/somaz94/ansible_user_management/actions/workflows/molecule-test.yml/badge.svg)](https://github.com/somaz94/ansible_user_management/actions/workflows/molecule-test.yml)
[![Release](https://github.com/somaz94/ansible_user_management/actions/workflows/release.yml/badge.svg)](https://github.com/somaz94/ansible_user_management/actions/workflows/release.yml)
[![Galaxy Publish](https://github.com/somaz94/ansible_user_management/actions/workflows/galaxy-publish.yml/badge.svg)](https://github.com/somaz94/ansible_user_management/actions/workflows/galaxy-publish.yml)
[![GitHub tag](https://img.shields.io/github/v/tag/somaz94/ansible_user_management)](https://github.com/somaz94/ansible_user_management/tags)
[![License](https://img.shields.io/github/license/somaz94/ansible_user_management)](LICENSE)

An Ansible role for managing users on Unix/Linux systems — create, modify, and remove user accounts.

<br/>

## Requirements

- Ansible 2.9+
- Supported OS: Ubuntu 22.04+, Debian 11+, Rocky Linux 9+, Fedora 40+

<br/>

## Installation

```bash
ansible-galaxy role install somaz94.ansible_user_management
```

<br/>

## Role Variables

<br/>

### Defined in `defaults/main.yml`:

| Variable | Description | Default |
|----------|-------------|---------|
| `users_to_create` | List of users to create | `[]` |
| `users_to_modify` | List of users to modify | `[]` |
| `users_to_remove` | List of usernames to remove | `[]` |

<br/>

### User object properties:

| Property | Description | Default |
|----------|-------------|---------|
| `name` | Username (required) | - |
| `password` | SHA-512 hashed password | omit |
| `shell` | Login shell | `/bin/bash` |

<br/>

## Usage

<br/>

### Variables

```yaml
# vars.yml
users_to_create:
  - name: alice
    password: "$6$SomeHashedValue..."
    shell: "/bin/bash"
  - name: bob
    password: "$6$SomeHashedValue..."
    shell: "/bin/zsh"

users_to_modify:
  - name: alice
    shell: "/bin/zsh"

users_to_remove:
  - charlie
```

<br/>

### Playbook

```yaml
# site.yml
---
- hosts: localhost
  become: true
  vars_files:
    - vars.yml
  roles:
    - somaz94.ansible_user_management
```

```bash
ansible-playbook site.yml
```

<br/>

### Running Remotely

```ini
# inventory.ini
[servers]
my-server ansible_ssh_user=somaz ansible_ssh_private_key_file=~/.ssh/id_rsa
```

```yaml
# site.yml
---
- hosts: servers
  become: true
  vars_files:
    - vars.yml
  roles:
    - somaz94.ansible_user_management
```

```bash
ansible-playbook -i inventory.ini site.yml
```

<br/>

## Development

<br/>

### Prerequisites

- Python 3.x
- Docker (for Molecule testing)

<br/>

### Quick Start

```bash
make venv                          # Create venv and install dependencies
make test                          # Full molecule test (default: ubuntu2204)
make test DISTRO=ubuntu2404        # Test with Ubuntu 24.04
make test DISTRO=debian12          # Test with Debian 12
make test DISTRO=rockylinux9       # Test with Rocky Linux 9
make converge                      # Apply role only
make verify                        # Run verification only
make destroy                       # Destroy test instances
make lint                          # Run ansible-lint
make clean                         # Remove venv and build artifacts
```

<br/>

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
