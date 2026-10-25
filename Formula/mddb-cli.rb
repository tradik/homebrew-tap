# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.3"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.3/mddb-cli-v2.18.3-darwin-arm64.tar.gz"
      sha256 "dc499e78c6d4156167de46296cc3803bf2b6346bb8d7ae13c4a6a682e6fce4f9"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.3/mddb-cli-v2.18.3-darwin-amd64.tar.gz"
      sha256 "0c8264d44fb534b9682d9f9dd4abf99d532ede41466064f591d46827cbf5a459"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.3/mddb-cli-v2.18.3-linux-arm64.tar.gz"
      sha256 "a233f54fe072ef5a16f8caef570007221d9a782f7bf90abb6362b9001e11e640"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.3/mddb-cli-v2.18.3-linux-amd64.tar.gz"
      sha256 "11480261b59d4b8a038cfe9bc84271f9fcf42ab9cdf729ce0fef1d00fdcbb683"
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
