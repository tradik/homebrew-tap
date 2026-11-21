# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.9"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.9/mddbd-v2.19.9-darwin-arm64.tar.gz"
      sha256 "42f1f4800f54cd0000e94985de293079deeea8b7d7122fc992ec9a86e8ac4f59"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.9/mddbd-v2.19.9-darwin-amd64.tar.gz"
      sha256 "061e6d3837acfb03e4a4c5cb9699d5a7417a18bb9c90a319c463547abf43c663"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.9/mddbd-v2.19.9-linux-arm64.tar.gz"
      sha256 "4645d0e1c2ba4d4453c685f22fb9a884d0cac5bab89ab1822c0a8e798e24dd9c"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.9/mddbd-v2.19.9-linux-amd64.tar.gz"
      sha256 "0ee25fbb388c277fd16c651adc5358a74de71f4fb6903df4e92dec0b2f8b9ac5"
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
