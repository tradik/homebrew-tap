# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.4"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.4/mddb-cli-v2.18.4-darwin-arm64.tar.gz"
      sha256 "e96b15e1dd715a2cf7fef1e7d9447993361b81d1b475b8811c9a248e2cea05ee"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.4/mddb-cli-v2.18.4-darwin-amd64.tar.gz"
      sha256 "5f95b053c6b52deb4a8531db54be18dad2b74f7b62682622864648fdf725dcb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.4/mddb-cli-v2.18.4-linux-arm64.tar.gz"
      sha256 "f7f41d1cd2cd81856d678a0bc0fa08e4c1bb4f2d566bf2ea4a1d96d68bbc064b"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.4/mddb-cli-v2.18.4-linux-amd64.tar.gz"
      sha256 "ccde1ab4141527575d96e09cb3463427b67fd29a047f756254c6ff3db9487293"
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
