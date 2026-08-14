# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.5/wpexportjson-v1.8.5-darwin-arm64.tar.gz"
      sha256 "6a076069779c7ee0743c141f6181f23945fd95d9e9dda760717ce80e3c81bb73"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.5/wpexportjson-v1.8.5-darwin-amd64.tar.gz"
      sha256 "4ca205baf524a24a7cea5f7a77aa41e84fea7ced9c1b6a71441a8beb59590a43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.5/wpexportjson-v1.8.5-linux-arm64.tar.gz"
      sha256 "ae01538b5b8ae3b69766be402d08d5e39fa88dfae8607fb6e9a77c16bba42bd5"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.5/wpexportjson-v1.8.5-linux-amd64.tar.gz"
      sha256 "13d70d6d2b15c187234e94d9b54c35505405e77caeb4d2f30179b3aaabc5b004"
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
