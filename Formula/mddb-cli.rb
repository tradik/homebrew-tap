# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.9.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.6/mddb-cli-v2.9.6-darwin-arm64.tar.gz"
      sha256 "b231b1475a898ab03c2777d94eb112c0241b1921f40f0ff23141874e75b4c36a"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.6/mddb-cli-v2.9.6-darwin-amd64.tar.gz"
      sha256 "63b812f24254ac675337e0d5e4882b9ece2c43685bd7ee25dce56b3579ebf36c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.6/mddb-cli-v2.9.6-linux-arm64.tar.gz"
      sha256 "28d10519fe7ea2d09483b8f9d66d2087ad7a1c95c6bbde1dc4a8d44c336c4053"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.6/mddb-cli-v2.9.6-linux-amd64.tar.gz"
      sha256 "707db63009489a360a7d9abcc89fe81f1c494bac869da94077d6cfae281a8902"
    end
  end

  def install
    bin.install "mddb"
  end

  test do
    system "#{bin}/mddb", "--help"
  end
end
