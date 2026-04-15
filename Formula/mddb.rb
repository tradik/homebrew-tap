# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.9.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.10/mddbd-v2.9.10-darwin-arm64.tar.gz"
      sha256 "c189fcaf55794aa33527675229ac34d94dea0e8a4450e2b81f07ce02f5220dc2"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.10/mddbd-v2.9.10-darwin-amd64.tar.gz"
      sha256 "be6f841333950f1a6c20f47b951e7e65799604367ca53ebfac1a0a0a4df2fd9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.10/mddbd-v2.9.10-linux-arm64.tar.gz"
      sha256 "01260a4cc55102acf6072b97401d0b3e3029c65027d63235eceea8f685315423"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.10/mddbd-v2.9.10-linux-amd64.tar.gz"
      sha256 "1a97afa802c7944addff6f271d9f239cf74f696c63d83601048ab4a54d5110ae"
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
