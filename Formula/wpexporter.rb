# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.8.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.19/wpexportjson-v1.8.19-darwin-arm64.tar.gz"
      sha256 "bc0838d021fbad4ddb087089a01c1b561653f1d526c00a7221dbec65c06658ba"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.19/wpexportjson-v1.8.19-darwin-amd64.tar.gz"
      sha256 "460b89e5560a4416315a8f98f005068f3b131aebe6e0ad90d981d91e0a83766e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.19/wpexportjson-v1.8.19-linux-arm64.tar.gz"
      sha256 "907e14062ca9f0c65cdeb8032c974f2ac3a30c0a739d0330d5848050d5b2f37c"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.8.19/wpexportjson-v1.8.19-linux-amd64.tar.gz"
      sha256 "fe5b1e2d20403df65899a5af10a9d1d3b9d8666e19ed91f46680e556adeb925a"
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
