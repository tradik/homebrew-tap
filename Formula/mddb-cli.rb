# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.15.3"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.3/mddb-cli-v2.15.3-darwin-arm64.tar.gz"
      sha256 "fd34ca2d591929a062f399415c4105b4133121339f8d35b7bee3abf545ae3f7f"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.3/mddb-cli-v2.15.3-darwin-amd64.tar.gz"
      sha256 "06a69a5180479820f8d5c67a157189be64ca463a81bdb8f6e1f69bd28188bd18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.3/mddb-cli-v2.15.3-linux-arm64.tar.gz"
      sha256 "e7004208ec0cca260d0821ef540274f0115961800f0f320565abee2596fdc9bd"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.3/mddb-cli-v2.15.3-linux-amd64.tar.gz"
      sha256 "3fbd132047777dbcd3b29b42bf5d52fee7dfba8edca03edc4039752eebce7a88"
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
