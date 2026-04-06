# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.9.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.8/mddbd-v2.9.8-darwin-arm64.tar.gz"
      sha256 "eeadcbf476d566938fd8c309b1918f6d1d1d32722363bb557d8e4ff8e45cb5eb"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.8/mddbd-v2.9.8-darwin-amd64.tar.gz"
      sha256 "ead00cdf36673d5b36a34bd08dea6288fdc87338c745d0a6e61571225dc5f790"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.8/mddbd-v2.9.8-linux-arm64.tar.gz"
      sha256 "e0579731d6f2e6c3b492f930fb7316e53ba9964c89182216e16d0fcb8b3aa2df"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.8/mddbd-v2.9.8-linux-amd64.tar.gz"
      sha256 "0c13acea2cef42a07c20251646ba22056839cf6ea3727ef75c299c4fc7d2f254"
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
