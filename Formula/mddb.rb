# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.2/mddbd-v2.18.2-darwin-arm64.tar.gz"
      sha256 "cde99745090a1600678badf75005b897e85b399386d8413174ac3c4fd6e58355"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.2/mddbd-v2.18.2-darwin-amd64.tar.gz"
      sha256 "3fbaf29d5bc2cde1df3f5cc09e8c257a6994a550a22e5f9bac776cc0fbd4b4ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.2/mddbd-v2.18.2-linux-arm64.tar.gz"
      sha256 "cf8aee9d6ec13a07e5ce6cfef0915ba830ec286046d9848e8a0cc01aa3c08f5e"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.2/mddbd-v2.18.2-linux-amd64.tar.gz"
      sha256 "d35e8ad86cdf574431757474826ba5619a112e5c93bb5388ce0098d04d582450"
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
