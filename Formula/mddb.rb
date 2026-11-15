# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.6"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.6/mddbd-v2.19.6-darwin-arm64.tar.gz"
      sha256 "42d7022c09b3f8edfc1b81f3285ef8972990159d36fe06288fc2d1775cb3a83d"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.6/mddbd-v2.19.6-darwin-amd64.tar.gz"
      sha256 "c0d47d5d8460af8b9621f6896f692eb3a79959bf358f7c8e59bca248351b5b1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.6/mddbd-v2.19.6-linux-arm64.tar.gz"
      sha256 "07f4a0a892da13a195c7763b2c52a4d0c2c853b822ad75f4731cf89bb24e6a6f"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.6/mddbd-v2.19.6-linux-amd64.tar.gz"
      sha256 "3b000234727f5ff7ce42ffc053c54398e392fdd56a46cb496d239a391b3aa093"
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
