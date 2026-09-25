# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.15.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.2/mddbd-v2.15.2-darwin-arm64.tar.gz"
      sha256 "60f46ac9d2b127985932a9103c2c2a304e3c3be6f1b2595ab3baa612e861a700"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.2/mddbd-v2.15.2-darwin-amd64.tar.gz"
      sha256 "98a7b98b58b7a57427f1bd9e8a84089ee2e1a3eb7d55a4989dee675b57e58c8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.15.2/mddbd-v2.15.2-linux-arm64.tar.gz"
      sha256 "d50c5065339835096bc777a3284bd68f571e07e2898bed03d745d5b53e7deacb"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.15.2/mddbd-v2.15.2-linux-amd64.tar.gz"
      sha256 "568b281afbc38a0e8513dba1dd61680e4f739f7ecff6e59e57681f78299ed8a3"
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
