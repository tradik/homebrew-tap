# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.15.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.0/mddbd-v2.15.0-darwin-arm64.tar.gz"
      sha256 "8f91a79d8be54bb14695c00e0b49522a7bc2e1f550dd635be8f9d22cd475a8b1"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.0/mddbd-v2.15.0-darwin-amd64.tar.gz"
      sha256 "1d2cae01ee014777ac8e1e4af7e2092ca377142c65dbd447f9ac84dc401d2379"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.0/mddbd-v2.15.0-linux-arm64.tar.gz"
      sha256 "453ae3b8f1c614e6c3f77228aaa36806584208dafd1953451a20ba6440c51888"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.0/mddbd-v2.15.0-linux-amd64.tar.gz"
      sha256 "d555e4c1598f918455eac4547d31276a889193d72762f77a6126f39395b88c41"
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
