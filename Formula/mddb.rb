# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.3"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.3/mddbd-v2.18.3-darwin-arm64.tar.gz"
      sha256 "758b68d25dd90c1ae319869b8fccec64b74bf8416f60508e9b10f532afee5001"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.3/mddbd-v2.18.3-darwin-amd64.tar.gz"
      sha256 "4e8403b96bf296301fb0d33981a5feae5964453c2b47164691f8522a1efa556b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.3/mddbd-v2.18.3-linux-arm64.tar.gz"
      sha256 "9b24c3e612180daa33c692fd3b3b9e826f4c92f0dcd71689d1370021e4d26cdb"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.3/mddbd-v2.18.3-linux-amd64.tar.gz"
      sha256 "73e1c77ef153f84659aceca0d7012421acc0a2e8772ce7347ebba1fa0505da57"
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
