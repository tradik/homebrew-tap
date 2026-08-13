# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.2/wpexportjson-v1.8.2-darwin-arm64.tar.gz"
      sha256 "cdd1c0cf1e48c4c082ee1d10ff870852b1dbbf10d315b74ab970e11090aad4d8"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.2/wpexportjson-v1.8.2-darwin-amd64.tar.gz"
      sha256 "591d43f59f93679577072e1f428558319b08dc05832525918ff14074bd2cac55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.2/wpexportjson-v1.8.2-linux-arm64.tar.gz"
      sha256 "a02b746c9620a6834d33df5d3011698f64a92680b7778868b1e3615a6f1bf581"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.2/wpexportjson-v1.8.2-linux-amd64.tar.gz"
      sha256 "3d0c5e1c8b429e3a7140ecf369651cf6c2afdb967ec7d7df6ad87ee7f9dec505"
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
