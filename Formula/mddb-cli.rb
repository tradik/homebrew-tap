# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.9.14"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.14/mddb-cli-v2.9.14-darwin-arm64.tar.gz"
      sha256 "a92290ebbf1c633cf2fd2ce6ccfb577c3b26b54e980f6c743b72b0e2ff55ea8d"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.14/mddb-cli-v2.9.14-darwin-amd64.tar.gz"
      sha256 "dd76b3bb8646beae93d5d8011b47a51bf29bdffe7d693f8d4689ee3dee36e63d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.14/mddb-cli-v2.9.14-linux-arm64.tar.gz"
      sha256 "2344cc58d926b0de5d0ec3a5c85dc073d2388a3f21e3869a142c32f401eddec2"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.14/mddb-cli-v2.9.14-linux-amd64.tar.gz"
      sha256 "f043461b38df0e27b0f05daa73f4f10db142309565d4170856bf1b187c5503a4"
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
