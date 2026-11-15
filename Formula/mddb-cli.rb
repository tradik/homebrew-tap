# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.7"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.7/mddb-cli-v2.19.7-darwin-arm64.tar.gz"
      sha256 "0933af74f2d7127453561b9ac7a04a20ea3e396a83977721a5f0bdee0c6559b4"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.7/mddb-cli-v2.19.7-darwin-amd64.tar.gz"
      sha256 "14728a69614f64e17103b25006e6efd27ee980ce492e19f4924ace045f5456c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.7/mddb-cli-v2.19.7-linux-arm64.tar.gz"
      sha256 "6d11bbec59337b86c5d688535d8fe242e3831a480ca20f5a48cd536d72184ff4"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.7/mddb-cli-v2.19.7-linux-amd64.tar.gz"
      sha256 "7ab283d4640528cc2609fd47e7ad158c829772d9855f6c47e4e6011d7babcb48"
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
