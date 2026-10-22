# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.17.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.0/mddb-cli-v2.17.0-darwin-arm64.tar.gz"
      sha256 "7da5d714fc950caa80c79b975a771c8f058813c516af505604272a4dc0de064b"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.0/mddb-cli-v2.17.0-darwin-amd64.tar.gz"
      sha256 "d2f51cf75f426a4c2ba517ac3184d36b1094bf8a8a6c7c303bdd2cadb8beebe3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.0/mddb-cli-v2.17.0-linux-arm64.tar.gz"
      sha256 "d9557083daf682e17bc34a9067902207b0141b38c35b988de942e70df941d2b0"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.0/mddb-cli-v2.17.0-linux-amd64.tar.gz"
      sha256 "c76650202c80ec8aa6340607a0e41dd9bf4ed300373bb688f0a1c53ee968097e"
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
