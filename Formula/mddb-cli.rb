# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.9.17"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.17/mddb-cli-v2.9.17-darwin-arm64.tar.gz"
      sha256 "5a69bc9f0e91f25c9959455e45f81115f07282bc65c093a760f25d187317a368"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.17/mddb-cli-v2.9.17-darwin-amd64.tar.gz"
      sha256 "fd21dcfe2b3a26aaa1648873ff87b1e6151acaa31b7163e63428d15b082bca4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.17/mddb-cli-v2.9.17-linux-arm64.tar.gz"
      sha256 "661feebf1093aa87bcada167630736b9d89bfbc1c79e297462495f9c9fbde946"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.17/mddb-cli-v2.9.17-linux-amd64.tar.gz"
      sha256 "3c54d1f39e3b5a58b8b2d34ddad1e2dee9751d20c89cbd520cbe30cc04739d00"
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
