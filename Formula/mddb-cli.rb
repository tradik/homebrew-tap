# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.6"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.6/mddb-cli-v2.18.6-darwin-arm64.tar.gz"
      sha256 "8daf5fd378b944bc50b1b548233c4fa5376a0fa36c6a40b543eb0f12edbe91d6"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.6/mddb-cli-v2.18.6-darwin-amd64.tar.gz"
      sha256 "56648d9ce129746745e6ce69e5870299c0ea7193a66e5650d7c921ac22403a57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.6/mddb-cli-v2.18.6-linux-arm64.tar.gz"
      sha256 "6a2255dcab8887e231383df267f90876fcc2e22629d248de1736493321ee419c"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.6/mddb-cli-v2.18.6-linux-amd64.tar.gz"
      sha256 "03ddfa7d9e2d27c8f3bbc4f50531bc1dd29c9d56650c44b726a00f6ed39fb154"
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
