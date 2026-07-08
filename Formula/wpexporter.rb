# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.6/wpexportjson-v1.7.6-darwin-arm64.tar.gz"
      sha256 "ae4b5e9404e93ce0df46fcf9b4bf06ba86ab599498697ed5c02e50c01a5bac7c"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.6/wpexportjson-v1.7.6-darwin-amd64.tar.gz"
      sha256 "c310e08853b885d23900fb5aa7e30a46693603e4a980650c9fd0ec66eb057e46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.6/wpexportjson-v1.7.6-linux-arm64.tar.gz"
      sha256 "ebed75284bc024054e549051edd043ee050bc8c2cde272d1d68705e3d888579a"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.6/wpexportjson-v1.7.6-linux-amd64.tar.gz"
      sha256 "7a669b2d4be4d86bcf2f86964e529a07756a109556d281818749801751fa78d2"
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
