# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.8"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.8/mddb-cli-v2.18.8-darwin-arm64.tar.gz"
      sha256 "9170e99863b3a9446099c1166398e731dfc6b93cdf4de1138148f4618a6d8066"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.8/mddb-cli-v2.18.8-darwin-amd64.tar.gz"
      sha256 "9ed083b76b4008bab6c23ecf44b20aac7e9860d589003cfed1ddc1c91cedc0ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.8/mddb-cli-v2.18.8-linux-arm64.tar.gz"
      sha256 "4851b8a833cc3b6a437bd573386cef69b5b4ec95255e5023163847102949a188"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.8/mddb-cli-v2.18.8-linux-amd64.tar.gz"
      sha256 "4d3072f5be706d1e2d9f5add9e23363b8b6bf69c39bdd99d8e92dd7a0c1c780a"
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
