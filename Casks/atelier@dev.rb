cask "atelier@dev" do
  version "0.0.1-dev.20260915151101"
  sha256 "5b668050d9b0a27bbd764c1e3f19669ef82cabbd927345490c86566b60849c32"

  url "https://github.com/jeremytondo/atelier-next/releases/download/v#{version}/atelier-#{version}-macos-arm64.tar.gz"
  name "Atelier"
  desc "Customizable workspace on Hammerspoon 2: Desktops, Groups, and Quick Apps"
  homepage "https://github.com/jeremytondo/atelier-next"

  conflicts_with cask: "jeremytondo/atelier/atelier"
  depends_on cask: "jeremytondo/atelier/hammerspoon2@dev"
  depends_on formula: "jq"
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  binary "bin/atelier"
  artifact "share/atelier", target: "#{HOMEBREW_PREFIX}/share/atelier"

  postflight do
    system_command "#{HOMEBREW_PREFIX}/bin/atelier", args: ["install"]
  end

  # Uninstall removes the package files. Zap also undoes what `atelier install`
  # wrote into Hammerspoon 2's settings and Login Items; the init file stays.
  zap login_item: "Hammerspoon 2",
      script:     {
        executable:   "/bin/sh",
        args:         ["-c",
                       "for key in configLocation hasCompletedOnboarding dockMenuBehaviour SUEnableAutomaticChecks; do defaults delete net.tenshu.Hammerspoon-2 \"$key\" 2>/dev/null; done; true"],
        must_succeed: false,
      }

  caveats <<~EOS
    This cask follows the newest dev release; each dev release replaces the previous one.
    Your configuration is ~/.config/atelier/init.js and is never removed.
    Run `atelier doctor` to check the installation.
  EOS
end
