# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.11.4"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddb-cli-v2.11.4-darwin-arm64.tar.gz"
      sha256 "6763dcff35a2155c75b2079bc6b99b3ada18cae245c2a8ffcd6dc3a92733e7b0"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddb-cli-v2.11.4-darwin-amd64.tar.gz"
      sha256 "a5e31c7910b0821a2fcc199545c1b6afc46bcad1c0cbc1731b54fad3b1d89557"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddb-cli-v2.11.4-linux-arm64.tar.gz"
      sha256 "95ff43e94c9891eac2884b77b3970406d366e40e9f486c71192c6e0ce9624130"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddb-cli-v2.11.4-linux-amd64.tar.gz"
      sha256 "8e431b1c16f7a0327e2c9b8948c19bbb6fd116f292f8d25ea630e89be4d1296e"
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
