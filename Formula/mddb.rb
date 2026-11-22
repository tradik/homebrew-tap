# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.11"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.11/mddbd-v2.19.11-darwin-arm64.tar.gz"
      sha256 "c4777a1a8bcd7dd873d3af9f1ba4ccbbc6aedc68dcd758e616af3132bc4f0392"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.11/mddbd-v2.19.11-darwin-amd64.tar.gz"
      sha256 "134c2a7c6d707afef1ba6740cd494754f35e8713463cc56bef35a9ef03284c80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.11/mddbd-v2.19.11-linux-arm64.tar.gz"
      sha256 "ffb4a8738f980b1049747089b17082974ff1b1cd881f682fcbd8f4c03d7a3bb9"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.11/mddbd-v2.19.11-linux-amd64.tar.gz"
      sha256 "4289d432c80e9cf593a5845d2f184be4865fd3f16afde75d16ba18c78358428d"
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
