# Configure a Workstation with Ansible


## About this script

There are three roles:
    - `base` -- applies to all machines, includes all the base programs (command-line only) and configuration files
    - `workstation` -- includes gui programs and configuration files
    - `server` -- includes programs required for servers and configuration files

Unlike the first script, this one is divided into roles. An Ansible role has a defined [directory structure](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html#role-directory-structure). Modules like [copy](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html#ansible-collections-ansible-builtin-copy-module) and [template](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/template_module.html#ansible-collections-ansible-builtin-template-module) expect to find files on specific directories.

The installation of packages and the creation of config files are separate due to the fact that programs are installed in `/usr/bin`, a shared directory, while config files are installed on user-specific directories.

Ansible tags use "or" (not "and") as a comparison, so create composed tags when needed.

Using `stow` would be a much easier option, but it won't let us apply a color theme across all programs. Because this script is executed via `ansible-pull` you will need to edit a file, commit and push the changes to the repo, and then run the script via `ansible-pull`.


## Before running this script

- This script is the continuation of the [ansible-arch-installation](https://github.com/mabq/ansible-arch-installation) script. Make sure you successfully run that script first.

- Review `/hosts`:

    Make sure the hostname of the machine where you will be executing this command is listed on the `/hosts` file. If you need to change the hostname use:

    ```sh
    sudo hostnamectl set-hostname {NEW-HOSTNAME}
    ```

    This command will update the following files: `/etc/hostname`, `/etc/hosts`, `/proc/sys/kernel/hostname`.

    Reboot the system to apply changes:

    ```sh
    sudo reboot now
    ```

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

Change directory into the cloned repo and run:

```sh
ansible-pull -U https://github.com/mabq/ansible-archlinux-workstation --vault-password-file ~/.vault_key
```

You will be prompted for the root password.

If no erros occur the machine should automatically shutdown after install. Remove install media and turn it back on.


## Credits

- https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md --- for providing the ansible structure
- https://github.com/ThePrimeagen/ansible --- for initially showing what Ansible is capable of.
