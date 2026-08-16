# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.11/wpexportjson-v1.8.11-darwin-arm64.tar.gz"
      sha256 "8c2e8e5b84689ac074e8e14e251a5182ee720689a68cd30e5072c4a7fe1f5843"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.11/wpexportjson-v1.8.11-darwin-amd64.tar.gz"
      sha256 "0b748b971f4d8935931cb637f7c5fd6755938757d41e1e270165d9ae41e13b21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.11/wpexportjson-v1.8.11-linux-arm64.tar.gz"
      sha256 "b6978c1225262372fc95fe4442c9189b698a0517b4b88790b726416e81380a32"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.11/wpexportjson-v1.8.11-linux-amd64.tar.gz"
      sha256 "e56afdd186cb63055f093a67349bc4ce9e85b3022b6439515c24cdfe4d5ff1b8"
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
