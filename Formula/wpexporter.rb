# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.10/wpexportjson-v1.7.10-darwin-arm64.tar.gz"
      sha256 "4ca72ebdcc10ba7848f0bbeab120d0c4bda4ebc82e5326fdd212ab95c853e10e"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.10/wpexportjson-v1.7.10-darwin-amd64.tar.gz"
      sha256 "543a97a300a52cc79cf2ee0c1919795285915fbed81c5441fab7ebccbf3b6406"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.10/wpexportjson-v1.7.10-linux-arm64.tar.gz"
      sha256 "00b41d641b822eb6079955b157e2dbc3a1f807885d4ddac538b50fee30ce9885"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.10/wpexportjson-v1.7.10-linux-amd64.tar.gz"
      sha256 "7a1071e264f49c68e0e1594a371f65a3b71ff754f1169b6dab440f25caa7646d"
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
