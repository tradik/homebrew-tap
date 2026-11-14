# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.3"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.3/mddb-cli-v2.19.3-darwin-arm64.tar.gz"
      sha256 "742241ab70dca87a6c8857dd90d727d404eb04de757fde5fd561e59f51e98598"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.3/mddb-cli-v2.19.3-darwin-amd64.tar.gz"
      sha256 "84168111708b215a1ae2661143405fc15c00ee93efde10c917e0f01d3b7bf742"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.3/mddb-cli-v2.19.3-linux-arm64.tar.gz"
      sha256 "5b608ab813425e2970d8cadc73b74ef12006a6e2c1373a7753aedc0f07d91ffd"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.3/mddb-cli-v2.19.3-linux-amd64.tar.gz"
      sha256 "8978212bdeae56d7a417dfc0d91481b732e3f47e82c4406bc9345162343d10ce"
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
