# CLAUDE.md - ansible_user_management

Ansible role for managing user accounts (create, modify, remove) on Linux systems.

## Commit Guidelines

- Do not include `Co-Authored-By` lines in commit messages.

## Project Structure

- **Language**: YAML (Ansible role)
- **Type**: Ansible Galaxy role (`somaz94.ansible_user_management`)
- Create users with hashed passwords and custom shells
- Modify existing user properties, remove users and home directories
- Multi-distro: Ubuntu 22.04+, Debian 11+, Rocky Linux 9+, Fedora 40+

## Key Files

- `tasks/main.yml` — User management logic (create, modify, remove)
- `defaults/main.yml` — Default variables
- `molecule/` — Molecule test scenarios

## Build & Test

```bash
make venv    # Create virtualenv + install deps
make test    # Run Molecule tests (default distro)
make lint    # Run ansible-lint
make clean   # Remove artifacts
```

## Usage

```yaml
# vars.yml
users_to_create:
  - name: alice
    password: "$6$hashed..."
    shell: "/bin/bash"
users_to_remove:
  - charlie
```

```bash
ansible-galaxy role install somaz94.ansible_user_management
ansible-playbook site.yml
```

## Language

- Communicate with the user in Korean.
