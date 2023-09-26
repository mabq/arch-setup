# Configure a Workstation with Ansible

- Recommendation:
    - When modifying, open this respository and the local config files side by side, change the local files, test and once you get it working update the setup files. Normal files can be copied and pasted but templates don't. Keep changes small to avoid forgeting updating the setup files.

> Before running this Ansible script, read [this](https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md#how-does-it-work).

Run it with: `ansible-pull -U https://github.com/mabq/ansible-archlinux-workstation --vault-password-file ~/.vault_key`

Ideas taken from:

- https://github.com/ThePrimeagen/ansible --- he basically installs the packages with Ansible and then run stow to import all the dotfiles
- https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md --- he generates the configuration files with Ansible


