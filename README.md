# Homebrew tap for Llama Swap Launcher

[Llama Swap Launcher](https://github.com/alron/llama-swap-mac-launcher) is a
macOS menu bar app that runs and monitors
[llama-swap](https://github.com/mostlygeek/llama-swap), with `llsl`, a
command-line tool for scripts and agents. It needs an Apple Silicon Mac with
macOS 15 or later.

```sh
brew trust --cask alron/llama-swap-mac-launcher/llama-swap-launcher
brew install --cask alron/llama-swap-mac-launcher/llama-swap-launcher
```

Homebrew loads a cask from a tap other than its own only once you've
trusted it; the first line trusts this cask alone.

This installs the app in `/Applications` and links `llsl` into Homebrew's
`bin`. It's the same signed and notarized zip as on the project's
[Releases](https://github.com/alron/llama-swap-mac-launcher/releases) page.

llama-swap isn't included. Install it separately, for example:

```sh
brew install mostlygeek/llama-swap/llama-swap
```

`brew upgrade` replaces the app while it runs, and the app restarts itself
into the new version once llama-swap has no requests in flight (Settings →
Tweaks: Restart on update). Upgrading from 0.3.2, the app quits instead;
open it again once. `brew uninstall` quits it, which stops llama-swap
first; `brew uninstall --zap` also removes its settings and logs, and asks
for your password to remove the GPU memory limit's files, which are root's.
If you raised that limit (Settings → Tweaks), untick it before
uninstalling: that returns macOS's default and removes the app's helper.
If you forgot, install the app again, untick, Save, then uninstall. Your
API keys stay in your login keychain; Keychain Access can delete them.

If you installed the app from a zip before, `--adopt` lets Homebrew take
over that copy, when it's the same version as the cask:

```sh
brew install --cask --adopt alron/llama-swap-mac-launcher/llama-swap-launcher
```

## Problems and security

This tap only holds the cask. Report problems, with the app or with
installing it through Homebrew, in the project's
[issues](https://github.com/alron/llama-swap-mac-launcher/issues), and
vulnerabilities as its
[SECURITY.md](https://github.com/alron/llama-swap-mac-launcher/blob/main/SECURITY.md)
says.

## License

The cask and this README are under the MIT License, as the app is; see
[LICENSE](LICENSE).
