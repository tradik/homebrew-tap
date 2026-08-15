# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.7/wpexportjson-v1.8.7-darwin-arm64.tar.gz"
      sha256 "acdc7919cbbb1547bd282ea8bc7c160024084f7fd1350dacf3a60ba0bd3173fd"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.7/wpexportjson-v1.8.7-darwin-amd64.tar.gz"
      sha256 "9b8c3ab2db878ae87d0f34daf08bf3076f7e393ac8abd1894af2ce04c17d960f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.7/wpexportjson-v1.8.7-linux-arm64.tar.gz"
      sha256 "23769fd266d93583ab804f6324187e0e4b1ebb95114ed1478abb88082639dbbe"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.7/wpexportjson-v1.8.7-linux-amd64.tar.gz"
      sha256 "2484b9e4ce9b53cf39419b5da2653961faa3c1448bc1573f36b44f2b8fa3484d"
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
