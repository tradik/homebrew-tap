# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.0/wpexportjson-v1.7.0-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.0/wpexportjson-v1.7.0-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_AMD64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.0/wpexportjson-v1.7.0-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.0/wpexportjson-v1.7.0-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_AMD64"
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
