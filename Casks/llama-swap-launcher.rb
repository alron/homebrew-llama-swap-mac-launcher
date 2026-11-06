cask "llama-swap-launcher" do
  version "0.3.4"
  sha256 "206d1640296a203cf62595adbebc3e52d276f0f05fcf19c0461d30d970771845"

  url "https://github.com/alron/llama-swap-mac-launcher/releases/download/v#{version}/Llama-Swap-Launcher-#{version}.zip"
  name "Llama Swap Launcher"
  desc "Menu bar app that runs and monitors llama-swap"
  homepage "https://github.com/alron/llama-swap-mac-launcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Llama Swap Launcher.app"
  binary "#{appdir}/Llama Swap Launcher.app/Contents/Helpers/llsl"

  # Quit the app before it's uninstalled: SIGTERM is its Quit, which stops
  # llama-swap and its models first. Found by bundle ID, so the dev build
  # (whose ID is longer) is left alone. Not `quit:`, which asks through
  # Apple Events and needs Automation access. Not on upgrade: from 0.3.3,
  # the app restarts itself into the version installed over it, once
  # llama-swap is idle. (The 0.3.2 cask quit it on upgrade too, and that
  # cask decides how 0.3.2 is upgraded.)
  uninstall signal: [["TERM", "com.my-wang.llama-swap-launcher"]]

  # The GPU memory limit's helper keeps its limit and log as root, so
  # they're deleted with sudo. Only on zap: uninstall's directives also run
  # on upgrade, and would erase the limit (and launchctl: would unload the
  # helper) at every brew upgrade.
  zap delete: [
        "/Library/Application Support/com.my-wang.llama-swap-launcher.wired-limit",
        "/Library/Logs/com.my-wang.llama-swap-launcher.wired-limit.log",
      ],
      trash:  [
        "~/Library/Application Support/com.my-wang.llama-swap-launcher",
        "~/Library/Logs/com.my-wang.llama-swap-launcher",
        "~/Library/Preferences/com.my-wang.llama-swap-launcher.plist",
      ]

  caveats <<~EOS
    llama-swap isn't included. Install it separately, for example:
      brew install mostlygeek/llama-swap/llama-swap
    Then open Llama Swap Launcher, choose your llama-swap config in its
    Settings, and Start.

    brew upgrade replaces the app while it runs, and it restarts itself
    into the new version once llama-swap is idle (Settings → Tweaks:
    Restart on update). Upgrading from 0.3.2, it quits instead: open it
    again once.

    If you raised the GPU's memory limit (Settings → Tweaks), untick it
    before uninstalling: that returns macOS's default and removes the
    app's helper. If you forgot, install the app again, untick, Save,
    then uninstall.
  EOS
end
