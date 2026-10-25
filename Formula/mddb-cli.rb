# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.2/mddb-cli-v2.18.2-darwin-arm64.tar.gz"
      sha256 "5d01191b84170b3859fd864d57dbc41309b22ab05655bb3f29a459e597eca932"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.2/mddb-cli-v2.18.2-darwin-amd64.tar.gz"
      sha256 "73a8b1b2908500357f5d7a0bfb3eab2567ed113745837234396e6e32ae4a0518"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.2/mddb-cli-v2.18.2-linux-arm64.tar.gz"
      sha256 "63d7f7540ef2e08159462b0e35e12aa09978f272a6566ddb57ab9bdc43728187"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.2/mddb-cli-v2.18.2-linux-amd64.tar.gz"
      sha256 "c21f3bb75fae77c4eeaa36866d2dbd5d8ac60c153bbfbd66c2bf8fd7c7a2269d"
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
