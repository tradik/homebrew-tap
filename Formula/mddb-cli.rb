# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.12.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.12.0/mddb-cli-v2.12.0-darwin-arm64.tar.gz"
      sha256 "eeebb9acab1d5b616cf0f7d0b5825032722a36ff3372fc764d28505a85f45d41"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.12.0/mddb-cli-v2.12.0-darwin-amd64.tar.gz"
      sha256 "c12c265912bc68603b99a0203226a40f7f78be75174929fefcc9ebd62b5fc7ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.12.0/mddb-cli-v2.12.0-linux-arm64.tar.gz"
      sha256 "2562bd59e2bdce61eb155c212488b9afc3991ef3c45f3b52665a14ff43a3e4d4"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.12.0/mddb-cli-v2.12.0-linux-amd64.tar.gz"
      sha256 "fb98d5f9849b8e5d0916a8df7478e850255469f54c92a7b0b5b5f4146525a199"
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
