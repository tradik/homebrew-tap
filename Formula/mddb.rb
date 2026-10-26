# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.5"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.5/mddbd-v2.18.5-darwin-arm64.tar.gz"
      sha256 "56de20fa8c4d3e2d969641690052720a94b4da066cdd19fb613f1e5f4259af09"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.5/mddbd-v2.18.5-darwin-amd64.tar.gz"
      sha256 "b3939aaf0835de9c412ee5288c28b2196f3d6249a832e674d0ae7fdb9bfadcae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.5/mddbd-v2.18.5-linux-arm64.tar.gz"
      sha256 "acbc579977cdccd0ed678bfc41f81bfeed019c248ece23740c710ce799264e4b"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.5/mddbd-v2.18.5-linux-amd64.tar.gz"
      sha256 "74920f17769058c23c6631311df1544545ad70b816589cc911bbfe2e1fc96fc6"
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
