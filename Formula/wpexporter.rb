# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.14/wpexportjson-v1.8.14-darwin-arm64.tar.gz"
      sha256 "a9b7934b7e3869c9b86e8dfdfcb8ddd80695dcdc878e70609e9f57b2edac81df"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.14/wpexportjson-v1.8.14-darwin-amd64.tar.gz"
      sha256 "0d12e1a069c43748212f39e11a8ef94fc703f61d5ed15d4538ed550076579468"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.14/wpexportjson-v1.8.14-linux-arm64.tar.gz"
      sha256 "9d093a7293872bc4440abcec9a896cf378d90e7a08375d04bcccbcc0a6f039db"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.14/wpexportjson-v1.8.14-linux-amd64.tar.gz"
      sha256 "8647fcab720a9fef5c2af05a8ffa8cb9002c2919e1abc0d91d97cd04d14b41e6"
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
