# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.13.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.13.0/mddb-cli-v2.13.0-darwin-arm64.tar.gz"
      sha256 "5383850c3f3f193e47c12e5a12bb6d62287e26925a64c76d17b73a0b21d8336a"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.13.0/mddb-cli-v2.13.0-darwin-amd64.tar.gz"
      sha256 "e8b14ae5dea1caa06b5591d909a2fbd589a9b037891687d53afac58c3e251849"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.13.0/mddb-cli-v2.13.0-linux-arm64.tar.gz"
      sha256 "1cfe030c85815b75a363d97563915ef195e17ee17498b8565c4fbe2827c735a1"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.13.0/mddb-cli-v2.13.0-linux-amd64.tar.gz"
      sha256 "d7516718bc25b5e7d2dbc54fcf3d33ff503d5495d0fc961cb391628f959e0181"
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
