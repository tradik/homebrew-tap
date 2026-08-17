# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.16/wpexportjson-v1.8.16-darwin-arm64.tar.gz"
      sha256 "f325362674de523419c912ef2fdb943a7ccb3110abb74200c3f539aa3d7ed231"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.16/wpexportjson-v1.8.16-darwin-amd64.tar.gz"
      sha256 "ec122562e231b850a668c690a4e2cbc870ccae4331de6661934d7dd9696d3f04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.16/wpexportjson-v1.8.16-linux-arm64.tar.gz"
      sha256 "665715532fd9a9fff7a5bbbea3b4bc032aaa9d21a75d4faf70a96db42e5ab522"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.16/wpexportjson-v1.8.16-linux-amd64.tar.gz"
      sha256 "124bd84e41e3382ce5d176e02c5af6a1d05a1ce88f2b421435c09a4456811e5f"
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
