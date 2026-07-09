# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.8/wpexportjson-v1.7.8-darwin-arm64.tar.gz"
      sha256 "b0d693769cd36c2b1fc587f64b5575ba94c146745977ae53fc503debcc3cc74b"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.8/wpexportjson-v1.7.8-darwin-amd64.tar.gz"
      sha256 "2f49924e70f47e59581e381dedc6d9ba7dcfe89d6a2ebca46f5e6e10357d60c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.8/wpexportjson-v1.7.8-linux-arm64.tar.gz"
      sha256 "83ece07e0eee43c22339de1da7575338dea21a0f73eafac647c39580bfe0ebfe"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.8/wpexportjson-v1.7.8-linux-amd64.tar.gz"
      sha256 "9e7db281cc3bd20c2b69fccb3277663855c125c48694b9480878df0baf00a7e0"
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
