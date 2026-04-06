# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.9.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.8/mddb-cli-v2.9.8-darwin-arm64.tar.gz"
      sha256 "bb196a7c5ea5feb357c5bbac469ebca62f223c2b9f97bdb8f4b959d5c6998c56"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.8/mddb-cli-v2.9.8-darwin-amd64.tar.gz"
      sha256 "473415d10b52448c5e4e15ffd9f508d4f4b70ff99d3a3349cbb05860cbda73f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.8/mddb-cli-v2.9.8-linux-arm64.tar.gz"
      sha256 "88941d80051b7ab608b9e8981b724f2b84efce632549d27be256e674ff45abb5"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.8/mddb-cli-v2.9.8-linux-amd64.tar.gz"
      sha256 "84034a08f094c05337d8ad56c1644278b827ac4c82d491919cba5da72135a6a3"
    end
  end

  def install
    bin.install "mddb"
  end

  test do
    system "#{bin}/mddb", "--help"
  end
end
