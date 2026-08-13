# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.3/wpexportjson-v1.8.3-darwin-arm64.tar.gz"
      sha256 "e5f1a2779e867a98758fb78184a45284a76f5ac462a5c537e69e0db028ffdef8"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.3/wpexportjson-v1.8.3-darwin-amd64.tar.gz"
      sha256 "d9ab21c14869d0fd99c36fa7c3048582aefc730783f7e0c7216f2f7eba8d77b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.3/wpexportjson-v1.8.3-linux-arm64.tar.gz"
      sha256 "705da5ce8f205d8f47cfbf5b4b8ad27f3690e753e55fb1164d29d7e2e2ba1892"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.3/wpexportjson-v1.8.3-linux-amd64.tar.gz"
      sha256 "130bfd66264ca631ac59f72896133ef652a5cb27b05667edf82c6b4fa7d7de2e"
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
