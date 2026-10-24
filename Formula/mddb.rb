# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.1/mddbd-v2.18.1-darwin-arm64.tar.gz"
      sha256 "e5c0733fcaa3b445f95522bcfb63608ffcccfccf9f7a6997506937083cb4d917"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.1/mddbd-v2.18.1-darwin-amd64.tar.gz"
      sha256 "c2aedeed8a5ec885321d0b578f9545f67277d9454c13b8f4eac9ba5258111f3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.1/mddbd-v2.18.1-linux-arm64.tar.gz"
      sha256 "7763bcf9e1a3f570087e0a38633b96deb61873631a6e53caddc93b033a6f83f1"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.1/mddbd-v2.18.1-linux-amd64.tar.gz"
      sha256 "77cec05adb3b65a8f09290393aa2bfc4d2e7dbe828d2cac52828efae947c9716"
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
