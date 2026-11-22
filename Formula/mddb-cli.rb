# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.13"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.13/mddb-cli-v2.19.13-darwin-arm64.tar.gz"
      sha256 "16fe6704e07836a5d422b40c24098d3d492f704cb08216c120411691de49fa84"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.13/mddb-cli-v2.19.13-darwin-amd64.tar.gz"
      sha256 "e6c94108a5490c5f0983dc9b6668da12dc8df48bc282130f0d670ba4c813e4b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.13/mddb-cli-v2.19.13-linux-arm64.tar.gz"
      sha256 "ad0d0585feb941bdcfcba0abcfb4c5501a02d045f31ecd897db4047c9ece7885"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.13/mddb-cli-v2.19.13-linux-amd64.tar.gz"
      sha256 "0ab86b0bc57555febf2d5c3cc430ba2393a40152d74fb83b068eca40fed3f31e"
    end
  end

  def install
    bin.install "mddb-cli"
    man1.install "mddb-cli.1" if File.exist?("mddb-cli.1")
  end

  test do
    system "#{bin}/mddb-cli", "--help"
  end
end
