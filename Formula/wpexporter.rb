# Homebrew formula for wpexporter - WordPress Export Tools
# Install: brew install tradik/tap/wpexporter
# Or: brew tap tradik/tap && brew install wpexporter

class Wpexporter < Formula
  desc "Export WordPress content to JSON, Markdown, Shopify, and 14+ formats"
  homepage "https://github.com/tradik/wpexporter"
  version "1.7.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.9/wpexportjson-v1.7.9-darwin-arm64.tar.gz"
      sha256 "27dd0b431fc652141f1bb72c9ad0aa6f4db2d8351bbbcbfe369ad62d5390d07b"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.9/wpexportjson-v1.7.9-darwin-amd64.tar.gz"
      sha256 "73ed1920ca3026ab44b500ec50b51fd1c9905759d0e1ac489e5032b7419341fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.9/wpexportjson-v1.7.9-linux-arm64.tar.gz"
      sha256 "365eb580804722f3d16c4bf8d8b93916cf7ded23e073aa7a88773de58ff32383"
    end
    on_intel do
      url "https://github.com/tradik/wpexporter/releases/download/v1.7.9/wpexportjson-v1.7.9-linux-amd64.tar.gz"
      sha256 "9a5e4b588d3fc6cd52637d0e0a82b2195893abfb17910056483798b71090ea82"
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
