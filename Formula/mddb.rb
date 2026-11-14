# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.5"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.5/mddbd-v2.19.5-darwin-arm64.tar.gz"
      sha256 "d999eb412aeaf755a165b8b5f91240a19b85f4dcf82960ece9ce7247d4fe2342"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.5/mddbd-v2.19.5-darwin-amd64.tar.gz"
      sha256 "12f52fc694c6ed2a1270e2bcd992a5147eb9d7a823989465d1ea1e0079003b60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.5/mddbd-v2.19.5-linux-arm64.tar.gz"
      sha256 "2080cd46e756b32312f01db9ca0ce89a97abb45532821a4841ef2ac031df2679"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.5/mddbd-v2.19.5-linux-amd64.tar.gz"
      sha256 "c65d747986fc6ce6ce01ddd2eb11f933011715594b6d089d58f84d77ce563a41"
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
