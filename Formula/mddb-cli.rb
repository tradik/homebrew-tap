# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.9.16"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.16/mddb-cli-v2.9.16-darwin-arm64.tar.gz"
      sha256 "da181fec59c1e91d76b62c78cce38497dcfc2147f9c9b633f1d0642a7d1a3730"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.16/mddb-cli-v2.9.16-darwin-amd64.tar.gz"
      sha256 "e94e1d8bd0ebb70e3c24f4399ea44b2ea3bf4e3793521f0230e3d19a86601876"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.16/mddb-cli-v2.9.16-linux-arm64.tar.gz"
      sha256 "d63261d53ed3eaac2d4300a58ab7f000829d6770c96810b9c5eb118e2a5fdeb2"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.16/mddb-cli-v2.9.16-linux-amd64.tar.gz"
      sha256 "6b75ba19570a6509a10775f2282e1922869409ccf170e5f493b522407e3819bd"
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
