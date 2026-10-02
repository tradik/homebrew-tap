# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.15.4"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.4/mddbd-v2.15.4-darwin-arm64.tar.gz"
      sha256 "485d19acdff71ff6b7754512665a62d4eb77b12be22fd00ef214f4b9e07ed4e5"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.4/mddbd-v2.15.4-darwin-amd64.tar.gz"
      sha256 "73e85ac5e28e8e5bd695d6a9b0b612d7c719a2c0a3381efbcd238794e595fe1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.4/mddbd-v2.15.4-linux-arm64.tar.gz"
      sha256 "f875141ee61791a9ef0dba7a571f784bbf5b16243c9071abb2e1448b1d911efc"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.4/mddbd-v2.15.4-linux-amd64.tar.gz"
      sha256 "56a8d09e3f5e62edd804eea8dba4f3e8ee8b3220b70db74c8a78ac309f396e9b"
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
