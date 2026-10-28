# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.7"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.7/mddb-cli-v2.18.7-darwin-arm64.tar.gz"
      sha256 "3814d8871c841180f1f760b35da76ef4117f73f19cabdf6658080f4194dca250"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.7/mddb-cli-v2.18.7-darwin-amd64.tar.gz"
      sha256 "ba51a746a7495e0b6f5d34dc3f2b1e0b7431ccf8d593c255a9590bcf5cef7790"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.7/mddb-cli-v2.18.7-linux-arm64.tar.gz"
      sha256 "0c974517dba19061c598da4fb4599b355644a52adf79f47d325754e9ea33bfff"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.7/mddb-cli-v2.18.7-linux-amd64.tar.gz"
      sha256 "cf86ff0459345f64129e0c5a767a90c3739af72f66ec1f51803772e87385c5d0"
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
