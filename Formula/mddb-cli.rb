# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.9.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.9/mddb-cli-v2.9.9-darwin-arm64.tar.gz"
      sha256 "c75c5072de39a49ce92a1cd599839ca671c612010d21f6b67fb08b1a668e7ab6"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.9/mddb-cli-v2.9.9-darwin-amd64.tar.gz"
      sha256 "934d1a2b34a989c6776910add8b84d8a1e1c2dee5e5d7903ed201dbb2102f630"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.9/mddb-cli-v2.9.9-linux-arm64.tar.gz"
      sha256 "3510fb291fc09fc2c1a1b87d2d90ba074211e5e3276e20a93c0baf480f14336d"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.9/mddb-cli-v2.9.9-linux-amd64.tar.gz"
      sha256 "6c7034c382b29948940390060e5c323509412cf0c25d298ec4e8f3a935c84f54"
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
