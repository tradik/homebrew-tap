# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.17.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.1/mddb-cli-v2.17.1-darwin-arm64.tar.gz"
      sha256 "17ad6d8e22863d716505d650dbcf254ce7e9d2f376ecd5bff5a57d8c281824d2"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.1/mddb-cli-v2.17.1-darwin-amd64.tar.gz"
      sha256 "84565ff6f8b3dd0579ff1f859e03715e9ce1465a963e79d51684debdda0b0549"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.1/mddb-cli-v2.17.1-linux-arm64.tar.gz"
      sha256 "d5b13555f6bfd09269613ce011c8665a078bf19e67815361fb597fe0fe12cc44"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.1/mddb-cli-v2.17.1-linux-amd64.tar.gz"
      sha256 "d434bd560fdd34d6b43c5db7f8d2fcb0761527fa26ce8dbec4d8eefb272e6c43"
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
