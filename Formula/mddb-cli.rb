# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.2"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.2/mddb-cli-v2.19.2-darwin-arm64.tar.gz"
      sha256 "aa914a5c0a992f604cfa0684e77ffc1c221f6bf0cd4732fab954dc224f5980bc"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.2/mddb-cli-v2.19.2-darwin-amd64.tar.gz"
      sha256 "203a5e835469f4fb9337173e6aef352c99bac731a669892e0f4d977cb73aa49c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.2/mddb-cli-v2.19.2-linux-arm64.tar.gz"
      sha256 "85f690ecc570a103fc5166145a1a47b83e189a29ad7f48f126a957a9ca79245f"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.2/mddb-cli-v2.19.2-linux-amd64.tar.gz"
      sha256 "43ad2e9a46ac6e88516215e4b474a266b189ccc87c7128aea70c8e069434dc6f"
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
