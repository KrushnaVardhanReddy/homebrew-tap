cask "paperpilot" do
  version "0.8.1"

  if Hardware::CPU.arm?
    url "https://github.com/KrushnaVardhanReddy/PaperPilot/releases/download/v#{version}/PaperPilot_#{version}_aarch64.dmg"
    sha256 "047c86e1e6db9faddc649047c12e6a8b39f6c2b64001e2abc028f3af8108714f"
  else
    url "https://github.com/KrushnaVardhanReddy/PaperPilot/releases/download/v#{version}/PaperPilot_#{version}_aarch64.dmg"
    sha256 "047c86e1e6db9faddc649047c12e6a8b39f6c2b64001e2abc028f3af8108714f"
  end

  name "PaperPilot"
  desc "Local-first, privacy-focused open source PDF studio and document manipulation toolkit"
  homepage "https://usepaperpilot.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "PaperPilot.app"

  zap trash: [
    "~/Library/Application Support/com.usepaperpilot.desktop",
    "~/Library/Caches/com.usepaperpilot.desktop",
    "~/Library/Preferences/com.usepaperpilot.desktop.plist",
    "~/Library/Saved Application State/com.usepaperpilot.desktop.savedState",
  ]
end
