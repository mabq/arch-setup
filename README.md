# Configure a Workstation with Ansible

Notes:

- There is no inventory because this is meant to be used with `ansible-pull` against the localhost.
- `ansible-pull -U https://github.com/mabq/ansible-archlinux-workstation --vault-password-file ~/.vault_key`

Ideas taken from:

- https://github.com/ThePrimeagen/ansible --- he basically installs the packages with Ansible and then run stow to import all the dotfiles
- https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md --- he generates the configuration files with Ansible

