# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.15.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.0/mddb-cli-v2.15.0-darwin-arm64.tar.gz"
      sha256 "27749335ee02efdaccc09b6d4c08bfa84ba4337994829981ccdad5747ebdd4be"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.0/mddb-cli-v2.15.0-darwin-amd64.tar.gz"
      sha256 "f1e32cc17ef4a1cb025ea31773c9abcffbb60057f1ee4ede8441fbcb62429054"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.0/mddb-cli-v2.15.0-linux-arm64.tar.gz"
      sha256 "0b2dc32ec03947dc515ee5802cbf2664434a786f5af6c967615737092fa9cafa"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.0/mddb-cli-v2.15.0-linux-amd64.tar.gz"
      sha256 "cb1e34d1a89c422fc77434a9b2865e310582facf401b1eb0643503ab230bfb1f"
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
