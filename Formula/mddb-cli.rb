# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.1/mddb-cli-v2.18.1-darwin-arm64.tar.gz"
      sha256 "8529bdb7d87f3429bc3006c7daccdb1208d48e8d8780c2856b0725ecee95e8f3"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.1/mddb-cli-v2.18.1-darwin-amd64.tar.gz"
      sha256 "7367c2e75f1ae6fb48449fe86af94cc15f80091b54bf396d744acb62403de513"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.1/mddb-cli-v2.18.1-linux-arm64.tar.gz"
      sha256 "bfac9d2fb1757dbf96f9c85617c1cb3afaf5a88ab019d123bc8ce8fbc3c44e5e"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.1/mddb-cli-v2.18.1-linux-amd64.tar.gz"
      sha256 "cb5ba047baa7d075b2baae339fe8b4d2a6c8c9cb5eb6ff7c14ae0fa6640a7b00"
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
