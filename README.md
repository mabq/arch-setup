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

It's important that you execute this playbook with `ansible-pull`, some parts of the playbook assume that the controller and the managed node are the same machine -- Ansible evaluates the value of variables on the controller, look for `lookup('env', '{variable}')` to see where this matters.

All configuration files that do not require templating are created as links, that way you can update the content of the file and see the result immediately, without having to re-run this playbook.

Managing all packages themes from a single global variable required templating. I decided to sacrifice that in favor of links. I change config options much more often than themes. You can change a package's theme on its config file.

If a normal file with the same name already exists, the creation of a link or file will throw an error. I could force the creation by overwriting thee file but I prefer the error in order to avoid loosing any data that might be important.


## Before running this script

- Review the `/hosts` file and make sure the hostname of the machine where you will be executing this command is listed.

- Review the variables in `group_vars/all.yml`, if you need to overwrite any default value do so in the matching `host_vars/{hostname}.yml` file. If the script does not find a matching file for the `hostname` the default variables will apply (`group_vars/all.yml`).


## Run the script

To run the script execute the following command:

> Push all changes to the repository
> You should be able to change the destination directory without any problems
> The first time is going to take time, be patient

```sh 
ansible-pull --url https://github.com/mabq/arch-setup --vault-password-file ~/.vault_key --directory ~/projects/arch-setup
```

You will be prompted for the user's password. If no errors occur the machine should automatically reboot after installation completes.

