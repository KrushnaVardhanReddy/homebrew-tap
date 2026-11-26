class Paperpilot < Formula
  desc "Local-first, privacy-focused open source PDF studio & document manipulation CLI"
  homepage "https://usepaperpilot.com"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/KrushnaVardhanReddy/PaperPilot/releases/download/v#{version}/paperpilot-cli-macos-latest-aarch64-apple-darwin.tar.gz"
      sha256 "24210a0e70a08d950507ab20b067ff4550c216047df8bca13172a23b28ee7942"
    else
      # Fallback to arm64 until x86_64-apple-darwin binary asset is uploaded
      url "https://github.com/KrushnaVardhanReddy/PaperPilot/releases/download/v#{version}/paperpilot-cli-macos-latest-aarch64-apple-darwin.tar.gz"
      sha256 "24210a0e70a08d950507ab20b067ff4550c216047df8bca13172a23b28ee7942"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/KrushnaVardhanReddy/PaperPilot/releases/download/v#{version}/paperpilot-cli-ubuntu-22.04-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a53803a111e5e8aaac62d31c46ce384cb8f058d2956845362f3cbe356acc3674"
    end
  end

  def install
    bin.install "paperpilot"
  end

  test do
    assert_match "paperpilot", shell_output("#{bin}/paperpilot --help")
  end
end
