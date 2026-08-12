# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.1/wpexportjson-v1.8.1-darwin-arm64.tar.gz"
      sha256 "5f2c075414717555df0b8691390e32f8b241a34856c270d3949ceec67bee2547"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.1/wpexportjson-v1.8.1-darwin-amd64.tar.gz"
      sha256 "bd9fd95c876b38189c41f016beef90abdc8d7bb8da3d5d7fe9feee25a345d215"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.1/wpexportjson-v1.8.1-linux-arm64.tar.gz"
      sha256 "0e03d23b75b10101414ce8a8a4f68968cda8211b19b7e4fcd15bd17ff7e734fc"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.1/wpexportjson-v1.8.1-linux-amd64.tar.gz"
      sha256 "e0dd3d3af91308b014dc82dd4d6c0e1d21e77651c0a73f9054b7bafef2388f94"
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
