# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.0/wpexportjson-v1.8.0-darwin-arm64.tar.gz"
      sha256 "acc73d7e558624af3c6860ba4b9924b712161f8ec6b392e0e6c5e10cc8595eb5"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.0/wpexportjson-v1.8.0-darwin-amd64.tar.gz"
      sha256 "d23572d430230731b510b3bedc3743a921b9433a2332e0f5c79484c8e7c5b582"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.0/wpexportjson-v1.8.0-linux-arm64.tar.gz"
      sha256 "b27e2f2fc79f0276f9c20b7dc84373882bcc718d924c79175d8bb0e97833cb15"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.0/wpexportjson-v1.8.0-linux-amd64.tar.gz"
      sha256 "8208d12785f7bd99fca02a6c2f9cbebdcdf33fd585a5e1f953eca08a70073ef8"
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
