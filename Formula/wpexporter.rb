# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.10/wpexportjson-v1.8.10-darwin-arm64.tar.gz"
      sha256 "d1914206ef4140d6de60d09c0536f34e7367a55fbdbebac4ce0512398da472b4"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.10/wpexportjson-v1.8.10-darwin-amd64.tar.gz"
      sha256 "8637beb767b38ad67779940720c3444b289ee347eb3952ab1a55b985d1a18dba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.10/wpexportjson-v1.8.10-linux-arm64.tar.gz"
      sha256 "78a319308dfe81727745def1e6b265039db4b3ea333c724a9c5bdcf95da1646c"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.10/wpexportjson-v1.8.10-linux-amd64.tar.gz"
      sha256 "63929662d394936e28f67f1df8d3c937a83199416bfe7222369731716ba481e5"
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
