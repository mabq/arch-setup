# Ansible Post Installation Script

To automate my Archlinux setup I created 2 ansible playbooks:

1. [Arch-base](https://github.com/mabq/arch-base) - fully automates a [basic Archlinux installation](https://wiki.archlinux.org/title/Installation_guide).

2. [Arch-setup](https://github.com/mabq/arch-setup) (thiss repo) - installs and configures everything.


## Why two different scrips?

The Arch-base playbook is meant to be used only once, when installing Arch, from a controller machine.

This playbook is meant to be executed all the time from the same machine via `ansible-pull`.


## What do you need to run this playbook?

  - This playbook assumes you installed Archlinux with the [arch-base](https://github.com/mabq/arch-base) playbook. If you used any other method notice that:

    - `base-devel`, `ansible` and `git` must be installed.
    - The user running the playbook must have `sudo` privileges.

  - The encryption key must be stored in `~/.vault_key`.


## About this playbook

This playbook installs and configures all packages, allowing you to start working immediately.

The first time you run this playbook it will take about an hour to complete (installing and compiling some packages takes time). Sub-sequent runs will take a minute or so (depending on updates).

This playbook is designed to be run on each host with `ansible-pull`. Some parts of the playbook assume that the controller and the managed node are the same machine. Ansible evaluates the value of variables on the controller, look for `lookup('env', '{variable}')` to see where this matters.

Templating in configuration files is used only when encryption is required (e.g. spotifyd). Most configuration files are linked so you don't need to re-run this playbook to see the changes.

If for some reason you created a config file for a package before running this playbook, an error will be thrown when trying to create the link. While I can force the creation of the link by overwriting the original file I prefer to exit and show the error to avoid loosing data.


## Before running this script

- Review the `/hosts` file and make sure the hostname of the machine where you will be executing this command is listed.

- Review the variables in `group_vars/all.yml`, if you need to overwrite any default value do so in the matching `host_vars/{hostname}.yml` file.


## Run the script

To run the script execute the following command:

> Make sure you push all changes to the repository first.
> You should be able to change the destination directory without any problems

```sh 
ansible-pull --url https://github.com/mabq/arch-setup --vault-password-file ~/.vault_key --directory ~/projects/arch-setup
```

You will be prompted for the user's password. If no errors occur the machine should automatically reboot after installation completes.

> Check the home directory for Dropbox credentials.

