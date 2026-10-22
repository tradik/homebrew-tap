# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.17.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.2/mddb-cli-v2.17.2-darwin-arm64.tar.gz"
      sha256 "0ef522cc6005050bef73bc5e05a040279d8c8844fff3ae2b70c5aed525a77258"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.2/mddb-cli-v2.17.2-darwin-amd64.tar.gz"
      sha256 "2031b6f4988540e0a94b6e30c2fab99cab0d5b91238a26342dfff21c9366ff2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.2/mddb-cli-v2.17.2-linux-arm64.tar.gz"
      sha256 "1613521c06715e05326c4dae54b24d7e217edc047835719e18b9047e02d1dd3b"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.2/mddb-cli-v2.17.2-linux-amd64.tar.gz"
      sha256 "1cef238fab5a76511a25dcb2adffdfbe28e3d56eac99c6936b1189a60803298f"
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
