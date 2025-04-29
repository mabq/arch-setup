# Keyd notes

Important!
  DO NOT APPEND COMMENTS, PUT THEM IN THEIR OWN LINES

From the man page:

  - Included files should not contain an `[ids]` section.
  - Included files should not include other files (inclusion is non-recursive).
  - Included files should not end in `.conf`.

Useful commands:

- Use `sudo systemd enable/start keyd.service` to enable/start the service.
- Use `sudo keyd reload` to update changes on config files.
- Use `sudo journalctl -eu keyd` to check for errors.
- Use `keyd monitor` to show keyboards ids and keystrokes.
