# Atelier Homebrew tap

Homebrew packages for [Atelier](https://github.com/jeremytondo/atelier-next), a customizable macOS workspace running on Hammerspoon 2.

```sh
brew tap jeremytondo/atelier
```

Choose one channel once its first release has been published:

| Channel | Install | HS2 dependency |
| --- | --- | --- |
| Stable | `brew install --cask atelier` | `hammerspoon2` |
| Rolling dev | `brew install --cask atelier@dev` | `hammerspoon2@dev` |

The channels cannot be installed together. See [installation, updates, and channel switching](https://github.com/jeremytondo/atelier-next/blob/main/docs/releases.md) for instructions. Your configuration lives in `~/.config/atelier/init.js`.

Atelier release CI generates `Casks/` and updates only the published channel. Hammerspoon 2 downloads are official upstream releases or unpatched snapshots built, signed, and notarized by Atelier. Package definitions are maintained in the [Atelier source repository](https://github.com/jeremytondo/atelier-next/blob/main/scripts/casks.sh).
