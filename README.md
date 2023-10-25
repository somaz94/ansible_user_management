# Role Name

ansible_user_management

This Ansible role facilitates user management tasks such as creating, modifying, and removing users on a Unix/Linux system.

<br/>

## Requirements

This role does not have any pre-requisites other than a standard Ansible setup. The target system should have the necessary privileges to create, modify, or delete user accounts.

<br/>

## Role Variables

The following variables can be set to manage users:

### Defined in `defaults/main.yml`:
- `users_to_create`: A list of users you wish to create.
- `users_to_modify`: A list of users you wish to modify.
- `users_to_remove`: A list of usernames you wish to remove.

```bash
# defaults/main.yml
users_to_create: []
users_to_modify: []
users_to_remove: []
```

### Defined in `vars/main.yml`:

You can define user-specific details like their name, hashed password, and preferred shell.

```bash
# vars/main.yml
users_to_create:
  - name: alice
    password: "$6$SomeHashedValue..." # hashed_alice_password
    shell: "/bin/bash"
  - name: bob
    password: "$6$SomeHashedValue..." # hashed_bob_password
    shell: "/bin/zsh"
  - name: charlie
    password: "$6$SomeHashedValue..." # hashed_charlie_password
    shell: "/bin/bash"

users_to_modify:
  - name: alice
    password: "$6$SomeNeWHashedValue..." # new_hashed_alice_password
    shell: "/bin/zsh"

users_to_remove:
  - charlie
```

<br/>

## Dependencies

As of now, this role doesn't have any dependencies on other Ansible Galaxy roles.

<br/>

## Example Playbook
Using the role in a playbook:

```bash
- hosts: localhost # or <hosts> (Remote Server)
  roles:
    - somaz94.ansible_user_management
```

<br/>

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

<br/>

## Author Information

- somaz94
- genius5711@gmail.com
- https://github.com/somaz94

