# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.3/wpexportjson-v1.7.3-darwin-arm64.tar.gz"
      sha256 "096d5c96e01f5ca98f43a5f507e853213ad302192ff2bdb959575510a62b2e2b"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.3/wpexportjson-v1.7.3-darwin-amd64.tar.gz"
      sha256 "4c1afec923898dc84535195c0acb5d13c933dafd1d6582f786aab0d07db72534"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.3/wpexportjson-v1.7.3-linux-arm64.tar.gz"
      sha256 "c21bfb853a0706860feb105a1d605e3a4a0c2e134f549b4c793757f62d9ed935"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.3/wpexportjson-v1.7.3-linux-amd64.tar.gz"
      sha256 "2396af7e02a9214cd74614e017559043c2f05daa9a58cf9ecff47a3c25bb28eb"
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
