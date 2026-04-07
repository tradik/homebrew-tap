# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.2/wpexportjson-v1.7.2-darwin-arm64.tar.gz"
      sha256 "7fe0b921861c44502d527486836fc154dc292855f5b87693bc2455aeea79f899"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.2/wpexportjson-v1.7.2-darwin-amd64.tar.gz"
      sha256 "37c88b1926716d66b241971570a0a57261ee8be43219ee11c2970fc8726eb497"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.2/wpexportjson-v1.7.2-linux-arm64.tar.gz"
      sha256 "4031b5d8d41ae294118a45948381610c0fd9bcb48fad2d4d7964e7414738528b"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.2/wpexportjson-v1.7.2-linux-amd64.tar.gz"
      sha256 "8dc189cf43c09d4f5e9e2672ef26e30884838ea8adadb6aa7612f9fda4a010fb"
    end
  end

  def install
    bin.install "wpexportjson"
    bin.install "wpxmlrpc"
    bin.install "wpmcp"
    man1.install "man/wpexportjson.1" if File.exist? "man/wpexportjson.1"
  end

  test do
    system "#{bin}/wpexportjson", "--help"
    system "#{bin}/wpxmlrpc", "--help"
  end
end
