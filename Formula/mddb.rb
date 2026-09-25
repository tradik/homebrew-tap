# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.15.3"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.3/mddbd-v2.15.3-darwin-arm64.tar.gz"
      sha256 "abf015a69c237ec8a27a941e31e2b63ca07d17c166b0780f5f83ea54a4d72151"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.3/mddbd-v2.15.3-darwin-amd64.tar.gz"
      sha256 "30f4d85a153c477ab8d2f437678c472c80d915c43bd40643469d9c99e4c8aa7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.3/mddbd-v2.15.3-linux-arm64.tar.gz"
      sha256 "c64f37f13fd51b60a1fca6f9985b2a54c103626126ac3f618d9cca8295d85c89"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.3/mddbd-v2.15.3-linux-amd64.tar.gz"
      sha256 "8a66976396e4b108ad05805f50c9cbef95dc7361841320ba5f738416f4e684a9"
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
