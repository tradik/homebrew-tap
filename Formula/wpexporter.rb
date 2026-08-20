# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.17/wpexportjson-v1.8.17-darwin-arm64.tar.gz"
      sha256 "014f5caf3fa3522ad211c53810311cccf8b6cb4e87fb80f9318ad5e88031dd81"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.17/wpexportjson-v1.8.17-darwin-amd64.tar.gz"
      sha256 "82e2ac91f20b2b9a8e13d825502fff7cceb9add88601f9ea5d85e88efaced021"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.17/wpexportjson-v1.8.17-linux-arm64.tar.gz"
      sha256 "93322cfd8dda32d05ef994ec4c910b5d82475e6240583fcd6a4ded9a546f0f1c"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.17/wpexportjson-v1.8.17-linux-amd64.tar.gz"
      sha256 "056764ea779a575a369e6a02d35fa69a7860634c351ee4ebad521bbdd2f0579f"
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
