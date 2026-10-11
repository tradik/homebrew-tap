# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.16.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.16.0/mddb-cli-v2.16.0-darwin-arm64.tar.gz"
      sha256 "d5c6ee1040fa6764950f4644e588525ca45bc83a1edf1f09128267df8ab0d72f"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.16.0/mddb-cli-v2.16.0-darwin-amd64.tar.gz"
      sha256 "abf9b44653453859400b808cb9b5ba17b5b29b6fd8d6f393fd76d4f70881fccb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.16.0/mddb-cli-v2.16.0-linux-arm64.tar.gz"
      sha256 "eba4c73c0377ef91a689219b02dc46edb7872465dbbd78bc193871fc5e9fd7f0"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.16.0/mddb-cli-v2.16.0-linux-amd64.tar.gz"
      sha256 "f6366c3abc50809148d7175fa218c11f003726f64db0a2cba2c2e8559083788e"
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
