cask "atelier@dev" do
  version "0.0.1,20260920160950"
  sha256 "a43d228c6e45454d7214be9db9d208416e2d52057d62fe1c18d97b5801dcc1b1"

  url "https://github.com/jeremytondo/atelier-next/releases/download/dev/Atelier-#{version.csv.first}-#{version.csv.second}.zip"
  name "Atelier"
  desc "Keyboard-driven workspace: Desktops, numbered windows, Quick Apps, leader menu"
  homepage "https://github.com/jeremytondo/atelier-next"

  conflicts_with cask: "jeremytondo/tap/atelier"
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Atelier.app"
  binary "#{appdir}/Atelier.app/Contents/Helpers/atelier"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Atelier.app/Contents/Helpers/atelier"]
  end

  # On an upgrade Homebrew quits a running Atelier with this and opens the new
  # one afterwards; one that was closed stays closed. Atelier finishes a command
  # in progress before it goes.
  uninstall quit: "com.elevenideas.Atelier"

  # The configuration in ~/.config/atelier is yours and is never removed.
  zap trash: "~/Library/Application Support/Atelier"

  caveats <<~EOS
    This cask follows the newest development build; each one replaces the last.
    Your configuration and the window lists are kept through upgrades, channel
    changes, and uninstalling; `atelier config open` opens the configuration.
    Run `atelier doctor` after an upgrade. If Homebrew could not quit Atelier,
    it says the old build is still running, and `atelier restart` puts that right.
  EOS
end
