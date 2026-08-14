# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.6/wpexportjson-v1.8.6-darwin-arm64.tar.gz"
      sha256 "dda28f3f192609594cc91d9503652022e4cf4afb3c138f51db6bf4b772ce9e6c"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.6/wpexportjson-v1.8.6-darwin-amd64.tar.gz"
      sha256 "47b26985173b1e49e2dff433b1ad371460e8ea66f3ab6e2ce35cefa8196850f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.6/wpexportjson-v1.8.6-linux-arm64.tar.gz"
      sha256 "99a86beacd9b4d420c20c0d6fd69ff05a0054714f4f4d02863a1016ff5dabee2"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.6/wpexportjson-v1.8.6-linux-amd64.tar.gz"
      sha256 "599eb9a80517775ae5ffa512bdc283cccc785f522b7f1c7726789f7cc93e0f99"
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
