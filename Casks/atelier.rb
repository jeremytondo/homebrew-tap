cask "atelier" do
  version "0.0.1,20260924190231"
  sha256 "d65cadc3160b77e519d61f34e05878b3b0ac1454d3b2967f5a95d77f05186f6c"

  url "https://github.com/jeremytondo/atelier-next/releases/download/v#{version.csv.first}/Atelier-#{version.csv.first}-#{version.csv.second}.zip"
  name "Atelier"
  desc "Keyboard-driven workspace: Desktops, numbered windows, Quick Apps, leader menu"
  homepage "https://github.com/jeremytondo/atelier-next"

  conflicts_with cask: "jeremytondo/tap/atelier@dev"
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
    Stable releases keep their versioned downloads.
    Your configuration and the window lists are kept through upgrades, channel
    changes, and uninstalling; `atelier config open` opens the configuration.
    Run `atelier doctor` after an upgrade. If Homebrew could not quit Atelier,
    it says the old build is still running, and `atelier restart` puts that right.
  EOS
end
