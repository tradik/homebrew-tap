# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.10.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.10.2/mddb-cli-v2.10.2-darwin-arm64.tar.gz"
      sha256 "a9094301f16588ce086bd32bdf099f2cdc62a818a4da6f2da2ac0e389df0a66b"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.10.2/mddb-cli-v2.10.2-darwin-amd64.tar.gz"
      sha256 "dce2c01878595ea4107308bcab2aba5774109cc024fb6db2adffe05f3d690a81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.10.2/mddb-cli-v2.10.2-linux-arm64.tar.gz"
      sha256 "352b9fe8718f3c2f690dd41778535fb0339780f87d903448e18d2384dcd54eed"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.10.2/mddb-cli-v2.10.2-linux-amd64.tar.gz"
      sha256 "8b0ddf1637f8269438cf2e254ced403cc072e5073e5c20622456a0261d0d0371"
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
