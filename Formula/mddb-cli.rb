# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.8"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.8/mddb-cli-v2.19.8-darwin-arm64.tar.gz"
      sha256 "dfd87ed85df4900ed658c2db137456a283c246df59687bcc12a666a94e9c9784"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.8/mddb-cli-v2.19.8-darwin-amd64.tar.gz"
      sha256 "0bc4ca9c7908f9e601cfbd202a68e7bd7130e350480edfa091e68ec0ffe86de8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.8/mddb-cli-v2.19.8-linux-arm64.tar.gz"
      sha256 "d5114fc930942a401d2b77a8153031666d09f42378495b66b54289bc14f4658b"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.8/mddb-cli-v2.19.8-linux-amd64.tar.gz"
      sha256 "c77b12125ded2fe5ca0ddb8dead8890221ec7499410b13f1144a1c95f69c2732"
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
