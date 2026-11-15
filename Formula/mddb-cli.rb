# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.6"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.6/mddb-cli-v2.19.6-darwin-arm64.tar.gz"
      sha256 "ecf088831ba8dbed83ce55c36817cee66496ff60b5c305dc4e71411c8e5d4308"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.6/mddb-cli-v2.19.6-darwin-amd64.tar.gz"
      sha256 "dd216743c3289701abf96373c5440fac85db3fcd38b0f4297babd7a15e095568"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.6/mddb-cli-v2.19.6-linux-arm64.tar.gz"
      sha256 "3106f6eb6756b50c650de59c5e257d6ac50b52a12f32c7fc5a49ac162595668a"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.6/mddb-cli-v2.19.6-linux-amd64.tar.gz"
      sha256 "ffeb94d04ba5d7f05dbe2b188e342d7602af4ba395a91804bc45ca790ba2f227"
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
