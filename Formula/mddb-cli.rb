# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.9"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.9/mddb-cli-v2.18.9-darwin-arm64.tar.gz"
      sha256 "841f14dd4fe96337ee0b200430db8599ac9a424dc591445be0a06884765a42ab"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.9/mddb-cli-v2.18.9-darwin-amd64.tar.gz"
      sha256 "bc2f30ab4cb80eed186c887283c3e407c38d8312745989dd90f7c63c96e4bc3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.9/mddb-cli-v2.18.9-linux-arm64.tar.gz"
      sha256 "be670175275709010b48bbca6449d3b98ef3cfae5da8ff12047aaf545a03acee"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.9/mddb-cli-v2.18.9-linux-amd64.tar.gz"
      sha256 "039ac6ce8b5252a8b06fcffbdf8ea8d0e01b5ff994ca90437669fc6aaee43c53"
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
