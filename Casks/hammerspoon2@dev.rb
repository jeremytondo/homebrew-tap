cask "hammerspoon2@dev" do
  version "133.1,0c5ddb07927d17e5da22c5cb0ffe4ce5e098254e01e51692942c0da8932b0c13"
  sha256 "2fd79caeb23be6a071e8bd1f736fe2c579ac0835359f7926cb51830be8cca127"

  url "https://github.com/jeremytondo/atelier-next/releases/download/hs2-0c5ddb07927d17e5da22c5cb0ffe4ce5e098254e01e51692942c0da8932b0c13/Hammerspoon.2.zip"
  name "Hammerspoon 2"
  desc "Hammerspoon 2 tested with Atelier (snapshot)"
  homepage "https://github.com/cmsj/Hammerspoon2"

  conflicts_with cask: "jeremytondo/atelier/hammerspoon2"
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Hammerspoon 2.app"

  uninstall quit: "net.tenshu.Hammerspoon-2"

  zap trash: "~/Library/Preferences/net.tenshu.Hammerspoon-2.plist"
end
