# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.15.4"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.4/mddb-cli-v2.15.4-darwin-arm64.tar.gz"
      sha256 "df38a9cfd28a4948492f40df9839c4894b0665037f730c907e40107697772d14"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.4/mddb-cli-v2.15.4-darwin-amd64.tar.gz"
      sha256 "c97b51f17f674f241162ebd2831e60a95a3d7b025663fc8b0de72dfe8f6b17d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.4/mddb-cli-v2.15.4-linux-arm64.tar.gz"
      sha256 "e5cc197ca5bf55eb9c8979fa9532e144877bb868365611732c3c9682aa08ad93"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.4/mddb-cli-v2.15.4-linux-amd64.tar.gz"
      sha256 "9d4c4b8f37d60bda8bf6624b4c1b5e944586c08ff2c9618b193cb2cec2693bc6"
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
