# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.0/mddbd-v2.18.0-darwin-arm64.tar.gz"
      sha256 "daf2cb399f682e7be150954ee628af034db1a9fbadec97dddfc44d32df3a425b"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.0/mddbd-v2.18.0-darwin-amd64.tar.gz"
      sha256 "2f734ad5dfb085e5e8a7e4f9c4252e5062493dd635bac61a32fd5cba862ced6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.0/mddbd-v2.18.0-linux-arm64.tar.gz"
      sha256 "407488ef3d65319c8f6170182b21e1035eb75e5a81eaa3680afacbf89beef924"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.0/mddbd-v2.18.0-linux-amd64.tar.gz"
      sha256 "181e70d78cadf4f043723ab6705adba53dcaef35e2f37acb14a650418e3cdcf8"
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
