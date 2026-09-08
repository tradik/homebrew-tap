# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.14.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.14.0/mddb-cli-v2.14.0-darwin-arm64.tar.gz"
      sha256 "8acb69e13c8cdb5659ca050f26a6ed27a7e1c1fab8448957c7a0c85ea298bdd9"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.14.0/mddb-cli-v2.14.0-darwin-amd64.tar.gz"
      sha256 "f1a31557a8cb3422ddf817b45676c0b252f0cf50aa04e950ef40fbddfe242f69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.14.0/mddb-cli-v2.14.0-linux-arm64.tar.gz"
      sha256 "0a6e3433c1a28e8be68af926856c836c21742d4dd10605ccfe9280a684b6033f"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.14.0/mddb-cli-v2.14.0-linux-amd64.tar.gz"
      sha256 "16421bd908523e2a9b49cd7a02b5099b2ad55bdefc26d42e32e3d185cc3e2ec5"
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
