# Configure a Workstation with Ansible

Before running this Ansible script, read [this](https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md#how-does-it-work).

Run it with: `ansible-pull -U https://github.com/mabq/ansible-archlinux-workstation --vault-password-file ~/.vault_key`

Ideas taken from:

- https://github.com/ThePrimeagen/ansible --- he basically installs the packages with Ansible and then run stow to import all the dotfiles
- https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md --- he generates the configuration files with Ansible

