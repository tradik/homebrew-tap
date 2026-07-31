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
      sha256 "a6b9c1220f59a07b6cede6b7db0668d13000b8e555027f3c5ea9878558abe935"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddb-cli-v2.11.4-darwin-amd64.tar.gz"
      sha256 "4bbc3299114da93bcb002f954ebfdb60925bce3009a922c5a4095e10b84caa55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddb-cli-v2.11.4-linux-arm64.tar.gz"
      sha256 "a563d163e5602c474e81a52c6ac4c018425681fa764e98c6dd03b3ad7a2139a6"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddb-cli-v2.11.4-linux-amd64.tar.gz"
      sha256 "0f59acf8c6fe0f9b884978ba8da3bf0dc8102556b2259ef9bad2d8e7687ac10f"
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
