# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.5/wpexportjson-v1.7.5-darwin-arm64.tar.gz"
      sha256 "7e502893be5578b014389805fc9beb812466ad5cc412341e22425a2c14cd6f90"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.5/wpexportjson-v1.7.5-darwin-amd64.tar.gz"
      sha256 "a00ad11b384b5264a9f013ec5a6d8412e4f76e512b083cb82b77adca41eaf3c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.5/wpexportjson-v1.7.5-linux-arm64.tar.gz"
      sha256 "eb2bf56903fbce13a62e2857a7877e203b086dce740bdbbe3f27b936c00f3b9c"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.5/wpexportjson-v1.7.5-linux-amd64.tar.gz"
      sha256 "51d02b3b79082731cb4d1a42be9467ff0c8893069048c19cf0b7c67aac74c9de"
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
