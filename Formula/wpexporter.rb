# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.15/wpexportjson-v1.8.15-darwin-arm64.tar.gz"
      sha256 "7af98c752e5a3fdb7be24610f825ca002581dea388dacc27688238452feee7be"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.15/wpexportjson-v1.8.15-darwin-amd64.tar.gz"
      sha256 "ab9c0ccf896e0d30bb81324f12544d08b131166046c1712b787c7bb29081fca2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.15/wpexportjson-v1.8.15-linux-arm64.tar.gz"
      sha256 "a83dd8af5c6942763f899d89cdadfc2b78e995255be9ad99621fc1573ca8ebce"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.15/wpexportjson-v1.8.15-linux-amd64.tar.gz"
      sha256 "3943d8ebf8c2c690222247b1c84a66f522257e70fcd99ebdb9eddb944f3e0213"
    end
  end

  def install
    bin.install "wpexportjson"
    bin.install "wpxmlrpc"
    bin.install "wpmcp"
    bin.install "wpexporter"
    man1.install "man/wpexportjson.1" if File.exist? "man/wpexportjson.1"
  end

  test do
    system "#{bin}/wpexporter", "--help"
    system "#{bin}/wpexportjson", "--help"
    system "#{bin}/wpxmlrpc", "--help"
  end
end
