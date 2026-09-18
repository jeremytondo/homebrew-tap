# jeremytondo/tap

Homebrew packages by Jeremy Tondo. Install anything here by its full name the first time, which also adds the tap; after that the short name does.

## Atelier

[Atelier](https://github.com/jeremytondo/atelier-next) is a keyboard-driven workspace for macOS: Desktops, numbered windows, Quick Apps, and a leader menu. It is a native Mac app with an `atelier` command inside it, and needs macOS 27 on Apple silicon.

| Channel | Install | What it follows |
| --- | --- | --- |
| Stable | `brew install --cask jeremytondo/tap/atelier` | Versioned releases |
| Development | `brew install --cask jeremytondo/tap/atelier@dev` | The newest development build |

The two are the same app in the same place, so only one is installed at a time; to switch, uninstall one and install the other. Your configuration in `~/.config/atelier/` and the window lists are kept through upgrades, switching, and uninstalling. Run `atelier doctor` to check an installation.

[Installing and releasing](https://github.com/jeremytondo/atelier-next/blob/main/docs/releases.md) covers updating, switching channels, and coming from the Hammerspoon version, which this tap carried under its old name, `jeremytondo/homebrew-atelier`.

Atelier's casks are written by its release workflow from [scripts/cask.sh](https://github.com/jeremytondo/atelier-next/blob/main/scripts/cask.sh); a release updates only its own channel's cask. Change them there, not here.
