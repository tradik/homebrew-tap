# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.9"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.9/mddb-cli-v2.19.9-darwin-arm64.tar.gz"
      sha256 "243140d479ba57eae0b986e3311d912fefc5922f4c68ddf19e95a4784089db3a"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.9/mddb-cli-v2.19.9-darwin-amd64.tar.gz"
      sha256 "8a27102bce1be2da0f2a870f8cabe2d6b303a96f7484561ccd745f2824da199e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.9/mddb-cli-v2.19.9-linux-arm64.tar.gz"
      sha256 "6b8dc757dd9dd6d9e60b89964c44ef89e0efa7ce1b55892218b25ca14b3b1803"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.9/mddb-cli-v2.19.9-linux-amd64.tar.gz"
      sha256 "c4d248c6c76364ed4407a9d83cd64c9f24b713b399a24a86bf9d8ef9e8a0a85b"
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
