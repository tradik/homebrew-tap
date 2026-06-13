# Homebrew formula for MDDB CLI
# Install: brew install tradik/tap/mddb-cli
# Or: brew tap tradik/tap && brew install mddb-cli

class MddbCli < Formula
  desc "Command-line interface for MDDB Markdown Database"
  homepage "https://github.com/tradik/mddb"
  version "2.10.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.10.0/mddb-cli-v2.10.0-darwin-arm64.tar.gz"
      sha256 "43afeaabe2c2ccaf0136956e8ea6ec86232b9dc9b405bf73d30f2b3dc403b840"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.10.0/mddb-cli-v2.10.0-darwin-amd64.tar.gz"
      sha256 "712ec1f76b15d88b7b995769518d1aaf6f58359ea4da53a05b07b5c532dace5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.10.0/mddb-cli-v2.10.0-linux-arm64.tar.gz"
      sha256 "d536702d3cb5c7584b8cac11c0f5a64000ad6cf74c455ecd39bb923561f9bcfa"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.10.0/mddb-cli-v2.10.0-linux-amd64.tar.gz"
      sha256 "1ae43cec635f647602f8f85d42b5ddb8d3360812494497862908a16274255305"
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
