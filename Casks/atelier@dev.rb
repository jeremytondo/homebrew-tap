cask "atelier@dev" do
  version "0.0.1,20260918204823"
  sha256 "7281972e11959a0a166fad803e0bd28951de3084764e0c3dfc5ec26294627eff"

  url "https://github.com/jeremytondo/atelier-next/releases/download/dev/Atelier-#{version.csv.first}-#{version.csv.second}.zip"
  name "Atelier"
  desc "Keyboard-driven workspace: Desktops, numbered windows, Quick Apps, leader menu"
  homepage "https://github.com/jeremytondo/atelier-next"

  conflicts_with cask: "jeremytondo/tap/atelier"
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Atelier.app"
  binary "#{appdir}/Atelier.app/Contents/Helpers/atelier"

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
