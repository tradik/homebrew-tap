# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.10"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.10/mddb-cli-v2.19.10-darwin-arm64.tar.gz"
      sha256 "505e64ea443b9f224bac85ac3daeca8bec375e8154004186155b3b7e2225267a"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.10/mddb-cli-v2.19.10-darwin-amd64.tar.gz"
      sha256 "ca1e2e24cc77bba7b141f0f790badc31064e02a8d41c26313c82972fd0d85a6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.10/mddb-cli-v2.19.10-linux-arm64.tar.gz"
      sha256 "16acf465e691d024085a42b71a4427020dae2e50d34521340d0d078c0a3397c1"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.10/mddb-cli-v2.19.10-linux-amd64.tar.gz"
      sha256 "c5d5f248a9e8b41897e6fa22571f9bb59b10c1d88e00251551f1ab5f316b7093"
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
