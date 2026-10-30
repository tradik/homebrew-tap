# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.18.10"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.10/mddb-cli-v2.18.10-darwin-arm64.tar.gz"
      sha256 "5a81346930f6dcc620e063f6427f975e68493dba52d4505ad71e9c24880a4265"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.10/mddb-cli-v2.18.10-darwin-amd64.tar.gz"
      sha256 "b68306df4ee7cc5c170d74f9172e21fc98a04bd3d0edc6835a43876a9d953e66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.10/mddb-cli-v2.18.10-linux-arm64.tar.gz"
      sha256 "e4a77956922709b70a0962bb2cfde02fae54e19a7294f41e05acc320de056e58"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.10/mddb-cli-v2.18.10-linux-amd64.tar.gz"
      sha256 "4374d36ccbf67702044e7a00624d5becac3479b25156802fa2690aef7eaf987e"
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
