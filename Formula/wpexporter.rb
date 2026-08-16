# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.12/wpexportjson-v1.8.12-darwin-arm64.tar.gz"
      sha256 "e50173a5dee759f7ac39a30a773cd9d4c5a9c492578dd81e81e42d1e7e545b05"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.12/wpexportjson-v1.8.12-darwin-amd64.tar.gz"
      sha256 "2937672c4589f46eea9ca5ed8387918831b3561e9d5787dda178aab53b6f5b52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.12/wpexportjson-v1.8.12-linux-arm64.tar.gz"
      sha256 "1288d569773f0389d37d5fd643f855636892d097de5f97a933067e16c7afb904"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.12/wpexportjson-v1.8.12-linux-amd64.tar.gz"
      sha256 "c5886ab5816587b033a4775a6436bf7035606cfefaf6f768fdaafb1c9b2396c2"
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
