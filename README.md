# Ansible Post Installation Script

To automate my Archlinux setup I created two Ansible playbooks:

1. [Arch-base](https://github.com/mabq/arch-base) - fully automates a [basic Archlinux installation](https://wiki.archlinux.org/title/Installation_guide).
2. [Arch-setup](https://github.com/mabq/arch-setup) (this repo) - installs and configures everything.


## Why two different scrips?

The `arch-base` playbook is meant to be used only once, when installing Arch on a new machine. That playbook must be executed from a controller machine (another machine where Ansible is installed and the `arch-base` repository is available).

This playbook, on the other hand, can be executed anytime you need to add new software and setup its configuration files. Unlike the first playbook, this one must executed with `ansible-pull` (no need for another machine).


## What do you need to run this playbook?

- This playbook assumes you installed Archlinux with the [arch-base](https://github.com/mabq/arch-base) playbook. If you used any other method notice that the `base-devel`, `ansible` and `git` packages must be installed, and the user running this playbook must have `sudo` privileges.
- The encryption key must be stored in `~/.vault_key`.


## About this playbook

This playbook installs and configures all packages, allowing you to start working immediately.

The first time you run this playbook it will take about an hour to complete. Sub-sequent runs will take a minute or so depending on required updates.

Templating in configuration files is used only when absolutely required (e.g. disks aliases). Most configuration files are links so you don't need to re-run this playbook to see the changes.

If for some reason you created a config file for a package before running this playbook, an error will be thrown when trying to create the link. While I can force the creation of the link by overwriting the original file I prefer to exit and show the error to avoid overwriting any data.

This playbook is designed to be run on each host with `ansible-pull`. Some parts of the playbook assume that the controller and the managed node are the same machine. Ansible evaluates the value of variables on the controller, look for `lookup('env', '{variable}')` to see where this matters.


## Before running this script

- Review the `/hosts` file and make sure the hostname of the machine where you will be executing this command is listed.
- Review the default variables in `group_vars/all.yml`, if you need to overwrite any, do it in the matching `host_vars/{hostname}.yml` file.


## Run the script

### The very first time:

1. Manually start the `ssh-agent` (see comments on the ssh task):

```bash
eval "$(ssh-agent)"
```

2. Run `ansible-pull` with https (ssh-keys are not yet configured):

```sh
ansible-pull --url https://github.com/mabq/arch-setup --vault-password-file ~/.vault_key --directory ~/projects/arch-setup
```

### For all sub-sequent runs:

1. The ssh-agent should be up and running, just make sure the private ssh-key is unlocked by adding the passphrase to the ssh-agent:

```bash
# No need to specify a key name, there is only one
ssh-add
```

2. Run `ansible-pull` with ssh (see notes on the `pre-tasks` file):

```sh
ansible-pull --url git@github.com:mabq/arch-setup.git --vault-password-file ~/.vault_key --directory ~/projects/arch-setup
```


## Post execution

After executing the playbook, check the home directory for Dropbox credentials.


## Additional notes

### Shell environment

Each ansible task runs in a new shell process, so changes like setting environment variables,
opening an encrypted private ssh key with its passphrase, creating temporary files, modifying
paths, and sourcing shell files are local to the task and do not persist after that task finishes.

See notes on "ssh" and "asdf" tasks.

For static values that you know ahead of time, just use the `/group_vars/all.yml` or
`/host_vars/{hostname}.yml` files.

For values that are the result of running a tasks, use the `register` directive to capture
output from one task and pass it as input to another task.

For shell "state stuff" (this is the tricky one), use the `shell` module to execute
several commands within the same task, because all of these commands are executed by
the same task they share the same shell instance.

Things that are already available to the shell from which you execute the `ansible-pull`
command will be available to all tasks.


### Nvidia issues

Hyprland v0.42.0 [release notes](https://github.com/hyprwm/Hyprland/releases/tag/v0.42.0) -- "Explicit sync support has been added and will be automatically turned on/off depending on your setup. For some select nvidia users, this might cause glitches. In such cases, disable it with [render](https://wiki.hyprland.org/Configuring/Variables/#render) `explicit_sync = false`.

Try editing how the GPU driver works. [Read](https://ubuntuforums.org/showthread.php?t=2498385).

> In Wayland, all configurations of libinput are made through the compositor. In Sway, scrolling works well on Brave but not on Firefox. In Hyprland, Firefox never had smooth scrolling, since Hyprland v0.42.0 Brave does neither. Hope this will be corrected in the next release.

