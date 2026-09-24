# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.15.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.1/mddbd-v2.15.1-darwin-arm64.tar.gz"
      sha256 "f662937048c1051c5d28f2020ce0d63646adb4b5d7d744e0a4fbfd76c2311016"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.1/mddbd-v2.15.1-darwin-amd64.tar.gz"
      sha256 "ae82a1d802c15b3d777494860cf8d5203401232b6cdbf74ffb488dd8495460fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.1/mddbd-v2.15.1-linux-arm64.tar.gz"
      sha256 "9629227a02cce95e29463965ce29910382bdc58c366fccf457a8c91983272ff5"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.1/mddbd-v2.15.1-linux-amd64.tar.gz"
      sha256 "d07b54d06c1f8cb22d681da9b8968e8e1d3ae9f46c2e533377342794d3877ba7"
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
