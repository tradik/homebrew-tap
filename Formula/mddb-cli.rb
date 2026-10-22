# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.16.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.16.1/mddb-cli-v2.16.1-darwin-arm64.tar.gz"
      sha256 "92b5afa166bddee56a657418e26553004b4079da638b885deaed5064c07c0401"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.16.1/mddb-cli-v2.16.1-darwin-amd64.tar.gz"
      sha256 "99a5ba14b4e04d7bcd4e54e11a21a6e01959a189bab445ef9d9c1ac19bdc8c32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.16.1/mddb-cli-v2.16.1-linux-arm64.tar.gz"
      sha256 "234a46366841b65117f42b0cc27259c971cd03f70934807e385afe450b8d4ea2"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.16.1/mddb-cli-v2.16.1-linux-amd64.tar.gz"
      sha256 "9bc9321abdeb44bd0f9ff31c0a710e7677c57622a0700adda8d7535edf230c92"
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
