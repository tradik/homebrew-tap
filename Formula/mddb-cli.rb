# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.11"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.11/mddb-cli-v2.19.11-darwin-arm64.tar.gz"
      sha256 "a199b7f12c6e231e9e4deac41f9da52564af0dac3c710651e3d2be432a099032"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.11/mddb-cli-v2.19.11-darwin-amd64.tar.gz"
      sha256 "24a86055d9f35994612bc1430d526932d73524276408a3c5a94b2752edf0f74c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.11/mddb-cli-v2.19.11-linux-arm64.tar.gz"
      sha256 "489e5994a66132e07e1a063486a155c6db05f81764d031bb40556a396b650577"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.11/mddb-cli-v2.19.11-linux-amd64.tar.gz"
      sha256 "0acf65ce2d5dfab9aa2e1647b7ba6f0fddcb73f2a2b3a3aaad54ef122c843e9a"
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
