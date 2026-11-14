# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.19.4"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.4/mddb-cli-v2.19.4-darwin-arm64.tar.gz"
      sha256 "13fed2535935a27e1c37a19bc7994a29de05be2d286a37bf48bdab5c5e5d4035"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.4/mddb-cli-v2.19.4-darwin-amd64.tar.gz"
      sha256 "08c15389ee2ab8ab3aa717a802efc8cf2357274c71e89f25fa8923c49c81fa52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.4/mddb-cli-v2.19.4-linux-arm64.tar.gz"
      sha256 "56085c3719fbd4eb0fcbb0ec05a96649fcad31bb69c55ad9ed867ab356672b96"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.4/mddb-cli-v2.19.4-linux-amd64.tar.gz"
      sha256 "1108827f0325a17b502d51b0d41a7211db513c7a7983bf5259cba89b687c4471"
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
