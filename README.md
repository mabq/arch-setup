# Ansible Post Installation Script

Two Ansible scripts automate my setup:

1. [ansible-arch-installation](https://github.com/mabq/ansible-arch-installation) - fully automates a [basic Archlinux installation](https://wiki.archlinux.org/title/Installation_guide), leaving the host ready to run the second script.
2. [ansible-post-installation](https://github.com/mabq/ansible-post-installation) (this script) - installs and configures all the tools I need.

If you used any other method to complete the base Archlinux installation, make sure the following requirements are met before running this script (review the first script):

   - `ansible` and `git` must be already installed (no configuration required).
   - `sudo` must be installed and the sudoer file (for the user XXXXXXXXX must be already configured. You must be logged in as the user for which you want to create all the configuration files.
   - The encryption password must be stored in a file called `/home/{user}/.vault_key`.


## About this script

This script **must** be executed with `ansible-pull`. Environmental variables are always evaluated on the controller, so some tasks assume the controller and managed node are the same machine (look for lines with `lookup('env', '{variable}')`).

Unlike the first script, this one is divided into roles (an Ansible role has a defined [directory structure](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html#role-directory-structure)). There are three roles:

    - `base` -- applies to all machines, installs and configures command-line utilities required on both setups
    - `workstation` -- installs and configures GUI programs
    - `server` -- installs and configures command-line programs only required on servers

There are 3 different directories where "source" configuration files are located:

   - Files that require templating must be placed in the `templates` directory.
   - Files that require encryption must be placed in the `files` directory.
   - Files that do NOT require templating or encryption can be placed in either:
     - the `links` directory --- changes made to source configuration files are directly reflected on the system via soft links (no need to re-run `ansible-pull`), you can decide later if you want to commit or discard the changes.
     - the `files` directory --- you need to re-run `ansible-pull` to apply any changes made to source config files (any changes made directly to destination files will be lost whenever you run `ansible-pull` again).

    > Using `stow` would be a much simpler approach for config files at the cost of not being able to use templating to apply a coherent color-scheme accross all programs.

About Ansible tags, keep in mind Ansible uses "or" not "and" as a comparison.


## Before running this script

- Make sure you are logged in as the user for which you want to create the config files (must have sudo privileges).

- Review the `/hosts` file:

    Make sure the hostname of the machine where you will be executing this command is listed on the `/hosts` file under the desired role.

- Review/change variables in `group_vars/all.yml`.

- Review/change variables in `host_vars/{hostname}.yml`:

    If the script does not find a matching file for the `hostname`, default variables will apply (`group_vars/all.yml`).


## Run the script

To run the script execute the following command (change the desired destination directory if needed, this is where your source configuration files will be stored):

```sh
ansible-pull --url https://github.com/mabq/ansible-post-installation --vault-password-file ~/.vault_key --directory {~/projects/ansible-post-installation}
```

You will be prompted for the user's password. If no erros occur the machine should automatically reboot after install.


## Credits

- https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md --- for providing the ansible structure
- https://github.com/ThePrimeagen/ansible --- for initially showing what Ansible is capable of.

