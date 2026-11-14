# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.4"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.4/mddbd-v2.19.4-darwin-arm64.tar.gz"
      sha256 "b94ceb80746d88da14b3114ff5f0eeaca3f08c9aac091712c4944f35341ddbd0"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.4/mddbd-v2.19.4-darwin-amd64.tar.gz"
      sha256 "0f6691f896bbdce3181223b724507a4aa7db14edd5eb16dc8a79fda80c61297c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.4/mddbd-v2.19.4-linux-arm64.tar.gz"
      sha256 "8f85881cecd9d9156d72ba1051f1013f8a7a4d646d94aec9cd7c8664acac693f"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.4/mddbd-v2.19.4-linux-amd64.tar.gz"
      sha256 "f0fa4367e08c6d50c0211d6358e37798b2aa3ae74141cbdf8500662848b80976"
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
