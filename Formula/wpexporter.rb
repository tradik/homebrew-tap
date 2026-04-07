# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.1/wpexportjson-v1.7.1-darwin-arm64.tar.gz"
      sha256 "9bc167062accb49970b0e57ff3212192a00b482b492e08ca67dfd2030cfdeed9"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.1/wpexportjson-v1.7.1-darwin-amd64.tar.gz"
      sha256 "0dcc1c9cfd62eb1cf2492cf42b373cfe93856db740419781d970a97840566a58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.1/wpexportjson-v1.7.1-linux-arm64.tar.gz"
      sha256 "c4ffddb2f277b3065f49a5574f5fc4b43fa911c028fc1aa713a81834835b7acf"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.1/wpexportjson-v1.7.1-linux-amd64.tar.gz"
      sha256 "a8c217a91b4b300dc67df972f7cb5be213c639957731f36aba88b7854f25e977"
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
