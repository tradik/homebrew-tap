# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.5"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.5/mddb-cli-v2.18.5-darwin-arm64.tar.gz"
      sha256 "6e4784a24cc54e830e4ade8f60016b56af1bd28a04dc9671dc2c6b0a79abf36c"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.5/mddb-cli-v2.18.5-darwin-amd64.tar.gz"
      sha256 "f6f64dfee99f44d6f5fed6d33a1720b436ba39113c75497411c7e20d1109ae87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.5/mddb-cli-v2.18.5-linux-arm64.tar.gz"
      sha256 "a6c65a6485ec58d89613471e306f18429215247d39f470a4535933a15dc5b50e"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.5/mddb-cli-v2.18.5-linux-amd64.tar.gz"
      sha256 "42951bdcb3bd89bf6a320dd99b5a2bf1c12c1636802a7af6aa7dbe2d5c670368"
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
