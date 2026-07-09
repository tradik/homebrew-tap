# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.7/wpexportjson-v1.7.7-darwin-arm64.tar.gz"
      sha256 "175b0b7a638d981b23dd57eefa087f58a57442b665f244c0a62305da921cbf97"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.7/wpexportjson-v1.7.7-darwin-amd64.tar.gz"
      sha256 "d4f6349fb71f1da44a2f2aad1c9006f88a888bb9cbcc437a815e8b4c9e4319ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.7/wpexportjson-v1.7.7-linux-arm64.tar.gz"
      sha256 "351605fd574a41acead9c89dc7f4e0156f4908bc8e5f376edcf0d6c9e9b8c3b3"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.7/wpexportjson-v1.7.7-linux-amd64.tar.gz"
      sha256 "93c770ebe3524271be594c58e433e0b68839654681206454304758dd0eed3fa4"
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
