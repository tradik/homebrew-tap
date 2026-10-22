# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.17.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.2/mddbd-v2.17.2-darwin-arm64.tar.gz"
      sha256 "f3159ce2fe52dde49ecbcf588022b4e913d08695ddb7c77fcbf23ac4ee348216"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.2/mddbd-v2.17.2-darwin-amd64.tar.gz"
      sha256 "96a40dc9dd83269813d02e9a5987231ded10a37716a52ef10bfdbe89e12d1df6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.2/mddbd-v2.17.2-linux-arm64.tar.gz"
      sha256 "283d8a01c01e4bcbd684cd737311e0c67f872dc7e6fc3e7b1a0d21fd9d777c73"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.2/mddbd-v2.17.2-linux-amd64.tar.gz"
      sha256 "754ec04c7dbc1dd3f858b52b3693c1e3de477ef763480eabe0efba4abfde869a"
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
