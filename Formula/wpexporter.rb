# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.4/wpexportjson-v1.8.4-darwin-arm64.tar.gz"
      sha256 "3863cf078b364e4938b1b2a97e78fbec1051c17e6c60e19fa369dbdb331a8ad0"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.4/wpexportjson-v1.8.4-darwin-amd64.tar.gz"
      sha256 "2f98e0c95af027bdfdf509808c3ec5b12426534d82c2ef85273c6135b6b1f9d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.4/wpexportjson-v1.8.4-linux-arm64.tar.gz"
      sha256 "7fb4f8e81f876bca059d3e7a82240482c51dd042aad5c2bce29d4d346234348d"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.4/wpexportjson-v1.8.4-linux-amd64.tar.gz"
      sha256 "30d599da9236810ddcae99ff53702c519a386e8217bd66892a93d801b418180e"
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
