# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.8/wpexportjson-v1.8.8-darwin-arm64.tar.gz"
      sha256 "be5fb965ab47c4f5a8a65d2271769799022ec6c8a0db79dd598be3e15f5327e1"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.8/wpexportjson-v1.8.8-darwin-amd64.tar.gz"
      sha256 "135502da70b82a4703599d6b8c6ca9a65dd55d474b1c7fba316883fe0445d526"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.8/wpexportjson-v1.8.8-linux-arm64.tar.gz"
      sha256 "07571d56df331a79e29aa6e99e419e26259d5d8b204faf10eadec34262435791"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.8/wpexportjson-v1.8.8-linux-amd64.tar.gz"
      sha256 "e16c1a570d003aa72c15984651a8dcbeb67c50a7f304b3a89e4b1eeea4d45564"
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
