# Configure a Workstation with Ansible

- Recommendation:
    - When modifying, open this respository and the local config files side by side, change the local files, test and once you get it working update the setup files. Normal files can be copied and pasted but templates don't. Keep changes small to avoid forgeting updating the setup files.

> Before running this Ansible script, read [this](https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md#how-does-it-work).

Run it with: `ansible-pull -U https://github.com/mabq/ansible-archlinux-workstation --vault-password-file ~/.vault_key`

Ideas taken from:

- https://github.com/ThePrimeagen/ansible --- he basically installs the packages with Ansible and then run stow to import all the dotfiles
- https://github.com/LearnLinuxTV/personal_ansible_desktop_configs/blob/main/README.md --- he generates the configuration files with Ansible


## Keybindings summary

| Key  | Modifiers       | Captured by | Description |
| :--- | :---            | :---        | :---        |
| e    | Mod1+Mod2+Shift | i3          | Reload i3   |
| e    | Mod1+Mod2+Shift | i3          | Exit i3 (back to the console)   |
| q | Mod1+Shift | i3 | Kill window |
| Q | Mod1+Shift | i3 | Kill window |



## Display Server


### Xorg



### Wayland

- Zoom, Dropbox, Megasync and some other packages just won't work on Wayland. GNOME uses some own implementation of the Qt library in order to make those programs work. In the meantime just keep using Xorg.
- Apart from GNOME you will hardly find a Window Manager with support for Nvidia.
- It's the future. All major distros are starting to migrate.
- Newer, more secure.


## Window managers

Goals:
    - Good documentation.
    - Bar:
        - Icons for background apps.
    - Monitors:
        - Assign workspaces to monitors.
        - Move through monitors.
    - Workspaces:
        - Move easily.
        - Assign programs to workspaces.
        - Send a window to a workspace.
    - Windows:
        - Float (ok)
        - Fullscreen (ok)
        - Locked (ok)
        - Flip
        - Swap
        - Resize
        - Send to a workspace (ok)
    - Scratchpad:
        - For many programs.

### i3

Good stuff:
    - Written in C and Perl, resource friendly.
    - Easy layouts (this shouldn't be a priority).
    - Good documentation.

Bad stuff:
    - Scratchpad is only really usefull for a single window --- to bring back a window from scratchpad I have to bring them one by one until I reach the one that I need.
    - When focusing a background window the one on top does not get away.
    - Float then unfloat does not put the window back where it was before floating.

### Sway 

- No support for Nvidia.
