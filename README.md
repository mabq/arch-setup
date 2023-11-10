# Ansible Post Installation Script

I have built two Ansible scripts to automate the configuration of my setup:

1. [ansible-arch-installation](https://github.com/mabq/ansible-arch-installation) - fully automates a [basic Archlinux installation](https://wiki.archlinux.org/title/Installation_guide), leaving the host ready to run the second script.
2. [ansible-post-installation](https://github.com/mabq/ansible-post-installation) (this script) - installs and configures all the tools I need.

Make sure you read the notes in the first script before you run this one.

If you used some other method to install Archlinux, make sure you comply with the following requirements before running this script:

   - `ansible` and `git` must be already installed, this script is executed via `ansible-pull`
   - You must be logged in as the user for which you want to create all the configuration files, `sudo` must be installed and the sudoer file must be already configured
   - The encryption password must be stored in a file called `/home/{user}/.vault_key` (see notes on the first script)


## About this script

This script must be run with `ansible-pull`. We specify where the repository must be cloned in 

There are three roles:

    - `base` -- applies to all machines, includes all the base programs (command-line only) and configuration files
    - `workstation` -- includes gui programs and configuration files
    - `server` -- includes programs required for servers and configuration files

Unlike the first script, this one is divided into roles. An Ansible role has a defined [directory structure](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html#role-directory-structure). Modules like [copy](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html#ansible-collections-ansible-builtin-copy-module) and [template](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/template_module.html#ansible-collections-ansible-builtin-template-module) expect to find files on specific directories.

The installation of packages and the creation of config files are separate due to the fact that programs are installed in `/usr/bin`, a shared directory, while config files are installed on user-specific directories.

Ansible tags use "or" (not "and") as a comparison, so create composed tags when needed.

Using `stow` would be a much easier option, but it won't let us apply a color theme across all programs. Because this script is executed via `ansible-pull` you will need to edit a file, commit and push the changes to the repo, and then run the script via `ansible-pull`.


## Before running this script


- Review `/hosts`:

    Make sure the hostname of the machine where you will be executing this command is listed on the `/hosts` file.

- Review/change the host variables:

    Make sure the variables that correspond to the hostname are correct (`host_vars/{HOSTNAME}.yml`. If the script does not find a matching file for the target machine hostname, default variables will apply (`group_vars/all.yml`).

- Review/change encrypted variables in the following files:

    - `/roles/base/tasks/vars/{USER}.yml`

    Because this repo is public you must encrypt the value of the password with an encryption password --- make sure you use a long, random encryption password. To avoid mistyping the password store it on a file with the following command:

    ```bash
    echo "{encryption-password}" > ~/.vault_key; chmod 600 ~/.vault_key
    ```

    Encrypt variables with:

    ```bash
    ansible-vault encrypt_string '{VARIABLE_VALUE}' --vault-password-file ~/.vault_key --name '{VARIABLE_NAME}'`
    ```

    Copy the output and replace the variable value in the corresponding file.


## Run the script

Run the following command using the desired destination directory:

```sh
ansible-pull --url https://github.com/mabq/ansible-post-installation --vault-password-file ~/.vault_key --directory {~/projects/ansible-post-installation}
ansible-pull --url ssh://user@host/path/to/repo.git --vault-password-file ~/.vault_key --directory {~/projects/ansible-post-installation}
```

You will be prompted for the root password.

If no erros occur the machine should automatically shutdown after install. Remove install media and turn it back on.


## Credits

- https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md --- for providing the ansible structure
- https://github.com/ThePrimeagen/ansible --- for initially showing what Ansible is capable of.
