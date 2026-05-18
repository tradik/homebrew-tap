# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.9.17"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.17/mddbd-v2.9.17-darwin-arm64.tar.gz"
      sha256 "cbcc40e350865db5f896bb3ed964f43d765866937ccb7d3c143e07947f126ca6"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.17/mddbd-v2.9.17-darwin-amd64.tar.gz"
      sha256 "f3f63144b4697377a2c66c60f15adf95c2dccbd9f0a60c375fdc5da2ca745dfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.17/mddbd-v2.9.17-linux-arm64.tar.gz"
      sha256 "df484259aabe4ea04efa6ffbb91a283007031b0e9f3afb6341683a4e9640148a"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.17/mddbd-v2.9.17-linux-amd64.tar.gz"
      sha256 "05cb57bee0b370cb7ec80db2e8b2801a533c3ad4148e1108eba8bde4b860694b"
    end
  end

  def install
    bin.install "mddbd"
  end

  service do
    run [opt_bin/"mddbd"]
    keep_alive true
    log_path var/"log/mddbd.log"
    error_log_path var/"log/mddbd.log"
    working_dir var/"mddb"
  end

  def post_install
    (var/"mddb").mkpath
  end

  test do
    system "#{bin}/mddbd", "--version"
  end
end
