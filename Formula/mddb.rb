# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.12"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.12/mddbd-v2.19.12-darwin-arm64.tar.gz"
      sha256 "4df921ac249072d163b9e81fc9da2dd99e8aac0d2ef314ae5452493ce04386db"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.12/mddbd-v2.19.12-darwin-amd64.tar.gz"
      sha256 "ebf4951231e41ee7d361f508ad0d6e5ab11eaab14f4246431ebe2f95a5215b96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.12/mddbd-v2.19.12-linux-arm64.tar.gz"
      sha256 "d992d216a37579a86a24fa4996153dc34d485046d5395b19601bdc766b76c316"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.12/mddbd-v2.19.12-linux-amd64.tar.gz"
      sha256 "fc7e879a7dd5d3fe352752d41807e57b3cf1156ff30f8c0168f1829cfae0edb8"
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
