# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.9.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.10/mddb-cli-v2.9.10-darwin-arm64.tar.gz"
      sha256 "bbe481a52d8d957d94087c1c0c03204feb20e7e17c32fa5fbd829d59563dcfe6"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.10/mddb-cli-v2.9.10-darwin-amd64.tar.gz"
      sha256 "c32b6641b401d905f6625b62d0d7d9270b6ac22d9f167662540be6a01a241144"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.10/mddb-cli-v2.9.10-linux-arm64.tar.gz"
      sha256 "8fbdcb6e0753c52546e185678145236665355ea47e84799f10439acc6813db8c"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.10/mddb-cli-v2.9.10-linux-amd64.tar.gz"
      sha256 "18372adc365146faa70af33f440aca95684d5634708a54162e218221467db670"
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
