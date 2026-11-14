# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.9.0/wpexportjson-v1.9.0-darwin-arm64.tar.gz"
      sha256 "0313ae20933b5087ea738ed3f31132a2c9324de2cd53e40d4a96e4738e01a6c7"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.9.0/wpexportjson-v1.9.0-darwin-amd64.tar.gz"
      sha256 "5e9130a55d9e131d2094fc0664599ca715a614ae3902b248b1696ed4d817e45c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.9.0/wpexportjson-v1.9.0-linux-arm64.tar.gz"
      sha256 "169e40815d27890fd20a529d68474f2682ea69900e4a699f9fb2422e32a621f7"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.9.0/wpexportjson-v1.9.0-linux-amd64.tar.gz"
      sha256 "25b737448085768344b57baa07ce8d2c2811978ac064140161de194cd9332739"
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
