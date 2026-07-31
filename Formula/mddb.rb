# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.11.4"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddbd-v2.11.4-darwin-arm64.tar.gz"
      sha256 "48b4e2488689019532046140372704ff53089f55d767d04dcc58903e74b867e9"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddbd-v2.11.4-darwin-amd64.tar.gz"
      sha256 "2851b930a68fb1f6a5fdbdcade2eeefd38c0938f08e9046702463e3a9d73e1f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddbd-v2.11.4-linux-arm64.tar.gz"
      sha256 "5efddef605b9d33bfb2d4e76752f1cd58f69ac37b579cb1f6bbedc93c15d5028"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddbd-v2.11.4-linux-amd64.tar.gz"
      sha256 "7cf4ce4cb3324eed9eb509636e35c7df4c858a78b28f6e53bade2900015aa868"
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
