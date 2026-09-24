# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.15.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.1/mddb-cli-v2.15.1-darwin-arm64.tar.gz"
      sha256 "f81ee0f814be47c991420931f3397bde35b4a7e9bb69afff1a78cdc877e7a6ab"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.1/mddb-cli-v2.15.1-darwin-amd64.tar.gz"
      sha256 "1e532a06a9432185046b9ee1d3e22a5c0ccbac59decebf73ad78252e8680c23b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.1/mddb-cli-v2.15.1-linux-arm64.tar.gz"
      sha256 "69dde1b68ab6f4b566637d81e2e3a136e52cd328d08abab822a965c410920077"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.1/mddb-cli-v2.15.1-linux-amd64.tar.gz"
      sha256 "90454582a7730bfef10f093cdb6a4517d25e2ea2fe70a8b018f8f702e802f957"
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
