# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.15.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.2/mddb-cli-v2.15.2-darwin-arm64.tar.gz"
      sha256 "ebb7a55c7cacb0d1108c079f0ca3153669f0b3e7d50c05f82025d4201d630545"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.2/mddb-cli-v2.15.2-darwin-amd64.tar.gz"
      sha256 "ed235946af190b75bf92851525c3e091d42f38baca6994c3e0472089ffc01953"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.2/mddb-cli-v2.15.2-linux-arm64.tar.gz"
      sha256 "0c946d6b7055f309bcb2b03a75576326f2196449636cbe9801d1ca00c1c8d589"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.2/mddb-cli-v2.15.2-linux-amd64.tar.gz"
      sha256 "aa4b16e1c0999441ccb5971e597c4c3ed4fbeb8ad9187fc9d01b59e0f20c3903"
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
