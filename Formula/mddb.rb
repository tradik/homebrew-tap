# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.10.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.10.0/mddbd-v2.10.0-darwin-arm64.tar.gz"
      sha256 "e39b1ed0009a279efd3fa53df2a607017aa6cbb2085378716d23f6fa0eb6dc90"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.10.0/mddbd-v2.10.0-darwin-amd64.tar.gz"
      sha256 "2ecaeab8251a85c052746f1acb9b983595091ebfdc30c447ac052c92969478a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.10.0/mddbd-v2.10.0-linux-arm64.tar.gz"
      sha256 "d2128bac745687fa614d8ab38c6e7a8c8d987f366f16ce1e924bba3b8efd4d1f"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.10.0/mddbd-v2.10.0-linux-amd64.tar.gz"
      sha256 "dfcc725982f9ef61c556989e1b0e86f4da6f9550af036bea7a72d3733c3b037b"
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
