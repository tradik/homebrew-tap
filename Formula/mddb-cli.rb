# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.1/mddb-cli-v2.19.1-darwin-arm64.tar.gz"
      sha256 "83518462b8861dc12528a05a9aefb6c0fe90a4acfcde3d0bb4774cce1240be31"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.1/mddb-cli-v2.19.1-darwin-amd64.tar.gz"
      sha256 "f7f350de4eacff4369a43845fb7780c9b535b96c9a4527018db82ab07b667ed3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.1/mddb-cli-v2.19.1-linux-arm64.tar.gz"
      sha256 "1d94c301530390245125302ec3710717ab1f8dbff933ce011737d7608ac659c7"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.1/mddb-cli-v2.19.1-linux-amd64.tar.gz"
      sha256 "8459899abb94ddf313ab73896990a855f79b8e544504b7f2d48622d6ebac6ce4"
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
