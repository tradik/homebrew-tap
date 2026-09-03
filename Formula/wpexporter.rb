# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.18/wpexportjson-v1.8.18-darwin-arm64.tar.gz"
      sha256 "c4128cb443acbf1a70dd150d02cfceb4310a5c8460aa2af275a9b993b4d365f4"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.18/wpexportjson-v1.8.18-darwin-amd64.tar.gz"
      sha256 "7e6ff389e6700b0816037d03b511b9e1c3f3a759e911a468318c848172dd8d9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.18/wpexportjson-v1.8.18-linux-arm64.tar.gz"
      sha256 "31f2bfd5d462cb335de0d4d90e6eaf64184a207a71c6be63ecc18ea41b01c1d0"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.18/wpexportjson-v1.8.18-linux-amd64.tar.gz"
      sha256 "9a622b74b9e92e83d3685b11671333b6dd0c6f33c70d6f8079c7b6564b12fabc"
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
