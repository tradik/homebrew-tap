# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.11.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddb-cli-v2.11.2-darwin-arm64.tar.gz"
      sha256 "8d8a50203cbff5eef5a8b7142cb307c22937c025cbfea20ed2459fb1172233f1"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddb-cli-v2.11.2-darwin-amd64.tar.gz"
      sha256 "0fb8d9d712fd45a31b8b85615248ce9c14a28c5da987c61c200d8fac4e17fce5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddb-cli-v2.11.2-linux-arm64.tar.gz"
      sha256 "63616b2f1080998762ec284ea2ba7e6d5bba8e70b353282c02685ee2b8b05ba9"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddb-cli-v2.11.2-linux-amd64.tar.gz"
      sha256 "1f01ab56f754ba2182b211cf4590a17d8a0aa16d013b868293c198a4a6c1d0d2"
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
