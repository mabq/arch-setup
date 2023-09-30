# Configure a Workstation with Ansible

- Recommendation:
    - When modifying, open this respository and the local config files side by side, change the local files, test and once you get it working update the setup files. Normal files can be copied and pasted but templates don't. Keep changes small to avoid forgeting updating the setup files.

> Before running this Ansible script, read [this](https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md#how-does-it-work).

Run it with: `ansible-pull -U https://github.com/mabq/ansible-archlinux-workstation --vault-password-file ~/.vault_key`

Ideas taken from:

- https://github.com/ThePrimeagen/ansible --- he basically installs the packages with Ansible and then run stow to import all the dotfiles
- https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md --- he generates the configuration files with Ansible


## Change passwords

- Change the value of the `password` variable in `/group_vars/all.yml` (if needed):

    That password will be used for disk encryption and for the root user --- make sure you use a long random password, you will almost never need to type it manually and it must be secure.

    Because this repo is public you must encrypt the value of the password with an encryption password --- also make sure you use a long, random encryption password. To avoid mistyping the password store it on a file with the following command:

    ```bash
    echo "{encryption-password}" > ~/.vault_key; chmod 600 ~/.vault_key
    ```

    Encrypt the password:

    ```bash
    ansible-vault encrypt_string '{password}' --vault-password-file ~/.vault_key --name 'password'`
    ```

    Copy the output and replace the `password` variable value in `/group_vars/all.yml`.
