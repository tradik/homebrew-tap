# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.9/wpexportjson-v1.8.9-darwin-arm64.tar.gz"
      sha256 "aa3a6bf85c6bb827212676aa8e36460b44bfa47ce8ea5fc4c2a1f1a84cd99b86"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.9/wpexportjson-v1.8.9-darwin-amd64.tar.gz"
      sha256 "1e499a3d97083ca907b398eba7f0585509dc79d8e11609d3e8e1a7b792135ad3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.9/wpexportjson-v1.8.9-linux-arm64.tar.gz"
      sha256 "7df6b17dd371fe04501919018d7da8a5fb96dbb84a4eb654f0c469dfcc175f26"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.9/wpexportjson-v1.8.9-linux-amd64.tar.gz"
      sha256 "b84730a4ac2976d214f9c541f9541d820c2586207928a2c26f0cb9287e528b54"
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
