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

`brew upgrade` quits the app, which stops llama-swap first; open it again
afterwards. `brew uninstall --zap` also removes its settings and logs.

If you installed the app from a zip before, `--adopt` lets Homebrew take
over that copy, when it's the same version as the cask:

```sh
brew install --cask --adopt alron/llama-swap-mac-launcher/llama-swap-launcher
```
