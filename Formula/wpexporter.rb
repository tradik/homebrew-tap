# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.13/wpexportjson-v1.8.13-darwin-arm64.tar.gz"
      sha256 "d27e6188e27c5a5f4b174deaf03c31b66db05758084646f241c0e48c130962ce"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.13/wpexportjson-v1.8.13-darwin-amd64.tar.gz"
      sha256 "5f2649551a057573bce48d473a74bad4ca0e45a10538b718767008eafa72c14c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.13/wpexportjson-v1.8.13-linux-arm64.tar.gz"
      sha256 "4d33eed3370053533cd3fa4355441679f5a7328092ba467cbc6d1888b17d7b10"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.13/wpexportjson-v1.8.13-linux-amd64.tar.gz"
      sha256 "e5129a580f6c01d1d05fafed51a6bb193feee8d0655ecdb6a68d0c2b3e107acb"
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
