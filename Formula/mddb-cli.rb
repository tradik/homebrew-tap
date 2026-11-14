# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.5"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.5/mddb-cli-v2.19.5-darwin-arm64.tar.gz"
      sha256 "7ac1530590fed8743b50840228575e944fa34af95e16dd145e71a2c135ef9994"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.5/mddb-cli-v2.19.5-darwin-amd64.tar.gz"
      sha256 "dca81fe7b63841274e870c94d598cbe23f8601621dd0947c995e075c68472a8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.5/mddb-cli-v2.19.5-linux-arm64.tar.gz"
      sha256 "0e4d9d469cc14af266e85c423c2fea0232ddb8afc85f58ae5a3e28ebfc222538"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.5/mddb-cli-v2.19.5-linux-amd64.tar.gz"
      sha256 "e0e564d6d3a9f5b709be74aa7f88239e59771ca8750ef72794b51bb30c50a77f"
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
