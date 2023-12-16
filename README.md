# Ansible Post Installation Script


## Requirements

This playbook assumes you installed Archlinux with the [arch-base](https://github.com/mabq/arch-base) playbook. If you used any other method notice that:

   - The following packages must be already installed:
      - `base-devel`
      - `ansible`
      - `git`
   - This playbook will create configuration files for the user currently logged in when executing the playbook. Make sure the user has `sudo` privileges.
   - The encryption key used to decrypt some of the variables of this playbook must be stored in `/home/{currently-logged-in-user}/.vault_key`.


## About this script

Its important that you execute this playbook with `ansible-pull`, some parts of the playbook assume that the controller and the managed node are the same machine. Ansible evaluates the value of variables on the controller (`lookup('env', '{variable}')`).

All configuration files that do not require templating are created as links, that way you can update the content of the file and see the result inmediatly. To apply changes in files that require templating you need to edit the files of this repository, commit and push the changes, and the re-run `ansible-pull`.

> Using `stow` is simpler but does not allow to apply a the same theme to all packages.


## Before running this script

- Review the `/hosts` file and make sure the hostname of the machine where you will be executing this command is listed.

- Review the variables in `group_vars/all.yml`, if you need to overwrite any default value do so in the matching `host_vars/{hostname}.yml` file. If the script does not find a matching file for the `hostname` the default variables will apply (`group_vars/all.yml`).


## Run the script

To run the script execute the following command:

> First time will take longer than usual because of package installation and builds

```sh 
# `--directory` is the path where the repo will be cloned
ansible-pull --url https://github.com/mabq/arch-setup --vault-password-file ~/.vault_key --directory {~/projects/arch-setup}
```

You will be prompted for the user's password. If no erros occur the machine should automatically reboot after install.

