# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.0/mddb-cli-v2.18.0-darwin-arm64.tar.gz"
      sha256 "d01c7539eb282749b3c4175fadbe51aeb5896522df41a78948c7b84b94b16c5b"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.0/mddb-cli-v2.18.0-darwin-amd64.tar.gz"
      sha256 "a771d49098083227fd6e445ac234fc0c8ac505c21ba17874a3f023b7700cd120"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.0/mddb-cli-v2.18.0-linux-arm64.tar.gz"
      sha256 "4c29af4a616053308746e4fd1b6987494006f4aad6ca69eb81d75dcf74802b42"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.0/mddb-cli-v2.18.0-linux-amd64.tar.gz"
      sha256 "71c3030061fca31cfa1ff4f829be5dd762c26c801272e7775516968b9863a543"
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
