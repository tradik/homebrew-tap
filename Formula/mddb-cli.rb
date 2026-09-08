# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.14.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.14.1/mddb-cli-v2.14.1-darwin-arm64.tar.gz"
      sha256 "e21ec1a8ddb9a7cd45a759853743c6a983218a86740781b050b395138b697075"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.14.1/mddb-cli-v2.14.1-darwin-amd64.tar.gz"
      sha256 "a559321d609d551e416706f81cc875af40e3d46b1c45743f4cbcf0e1083cc334"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.14.1/mddb-cli-v2.14.1-linux-arm64.tar.gz"
      sha256 "85392d40e141eb35688ed1a6f3927830cbe94bb010efb7873e491a453455f7e4"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.14.1/mddb-cli-v2.14.1-linux-amd64.tar.gz"
      sha256 "a04406611f11edb93e452f988914fe220c904792e734d58187b45c7518ee63f4"
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
