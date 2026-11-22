# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.12"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.12/mddb-cli-v2.19.12-darwin-arm64.tar.gz"
      sha256 "3211c41a6a82724fe76fd31ac74a24ca5045726a24eada4b1c384386b13e2d67"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.12/mddb-cli-v2.19.12-darwin-amd64.tar.gz"
      sha256 "ec68bd22d91b21980af75bde7a4db5f984452d65681fe70f30a43e1aefe080a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.12/mddb-cli-v2.19.12-linux-arm64.tar.gz"
      sha256 "b64133a2598b1a89ef90fa3ebf4d5ccf61dcc30858afb2dcaa32343086ccb440"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.12/mddb-cli-v2.19.12-linux-amd64.tar.gz"
      sha256 "669693de1ddbc8dea9e8a5a60f0edf9216c9d814be98f586318d58dda8df27e1"
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
