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
      sha256 "0bce5303477d2dc9eb6f2d7751c0faa20f32da07506303d1da51f4e99eaec278"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddb-cli-v2.11.2-darwin-amd64.tar.gz"
      sha256 "bd6f82cfbb6b906309d6d0390025ca635b4c4199066a043ad090e4f5dd9ded99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddb-cli-v2.11.2-linux-arm64.tar.gz"
      sha256 "67dded200f2f9c1b9503d513e8709b282f741e3960d36f66b0c2a7342dafc2e6"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddb-cli-v2.11.2-linux-amd64.tar.gz"
      sha256 "d4b001e26d3e51e440fe84e69a61994246c292ccf935931b3cab3263e970322c"
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
