# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.11.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddbd-v2.11.2-darwin-arm64.tar.gz"
      sha256 "8686c8963550063d8b4ef17afc60c63bd8fd3950f642da5aca025f418185c877"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddbd-v2.11.2-darwin-amd64.tar.gz"
      sha256 "2d7b9ebfeea780209c8762859e1894bb0ca979021395ca9e7fe4e43321de1ad9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddbd-v2.11.2-linux-arm64.tar.gz"
      sha256 "62f260502a605738b5c125d429512ac9edecf17cbdb68f206da85c9a141a500f"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddbd-v2.11.2-linux-amd64.tar.gz"
      sha256 "501a17e204f50dd79a20ec990241a8a1a53e029e471f4a7026cedd419db6264e"
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
