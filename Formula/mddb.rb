# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.8"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.8/mddbd-v2.18.8-darwin-arm64.tar.gz"
      sha256 "9dd2c90428c668dafeda041d16a1a537f59e54c8d09ad14e9ca2737a7d2b11ae"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.8/mddbd-v2.18.8-darwin-amd64.tar.gz"
      sha256 "bc4947345e6a1860e9a8eecae77073e127ea908f82bf17037b8efa1026ab9817"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.8/mddbd-v2.18.8-linux-arm64.tar.gz"
      sha256 "15ff74d70db501b6b6f8d379096e0f0ce55838cdb77d753375329292155dbddb"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.8/mddbd-v2.18.8-linux-amd64.tar.gz"
      sha256 "028a18169a909f907310ae297ee4ca19dc2e26c9aa6ee617543b069639b42889"
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
