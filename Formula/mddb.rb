# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.7"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.7/mddbd-v2.19.7-darwin-arm64.tar.gz"
      sha256 "e983479e96b0fa80ec7989c84b05865c8881467e56539a72369ff99cdba55509"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.7/mddbd-v2.19.7-darwin-amd64.tar.gz"
      sha256 "b3c929a67748892b95f032675181bcc61e558e52e3aaadb4b0e3b31c81a879dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.7/mddbd-v2.19.7-linux-arm64.tar.gz"
      sha256 "96429a4c96e8863a282f697b9ce8f7d72a74b282bcd532fa8376c359c05aa5a4"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.7/mddbd-v2.19.7-linux-amd64.tar.gz"
      sha256 "3ad5d005f50c059658c2882f8da0c517e1c8243e4afa489770c76ebe0177ff95"
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
