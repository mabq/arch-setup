# Ansible Post Installation Script


## Requirements

This playbook assumes you installed Archlinux with the [arch-base](https://github.com/mabq/arch-base) playbook. If you used any other method notice that:

   - The following packages must be already installed:
      - `base-devel`
      - `ansible`
      - `git`
   - This playbook will create configuration files for the user currently logged in when executing the playbook. Make sure the user has `sudo` privileges as some tasks in the playbook require elevated privileges.
   - The encryption key used to decrypt some of the variables of this playbook must be stored in `/home/{currently-logged-in-user}/.vault_key`.


## About this script

It's important that you execute this playbook with `ansible-pull`, some parts of the playbook assume that the controller and the managed node are the same machine. Ansible evaluates the value of variables on the controller (look for `lookup('env', '{variable}')` to see where this matters).

All configuration files that do not require templating are created as links, that way you can update the content of the file and see the result immediately. To apply changes in files that require templating you need to edit the files of this repository, commit and push the changes, and then re-run `ansible-pull`.

> If a file with the same name already exists the creatiion of the link/file will through an error. I could force the creatiion but I prefer the error in order to avoid loosing any data that might be important.


## Before running this script

- Review the `/hosts` file and make sure the hostname of the machine where you will be executing this command is listed.

- Review the variables in `group_vars/all.yml`, if you need to overwrite any default value do so in the matching `host_vars/{hostname}.yml` file. If the script does not find a matching file for the `hostname` the default variables will apply (`group_vars/all.yml`).


## Run the script

To run the script execute the following command:

> The first time is going to take time, be patient

> Important!
> `~/projects/arch-setup/` is hardcoded into some configuration files, if you ever change the destination directory use `rg --hidden --fixed-strings projects/arch-setup` to check all the files that you will need to update.

```sh 
ansible-pull --url https://github.com/mabq/arch-setup --vault-password-file ~/.vault_key --directory ~/projects/arch-setup
```

You will be prompted for the user's password. If no errors occur the machine should automatically reboot after installation completes.

