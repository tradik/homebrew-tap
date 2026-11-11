# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.1/mddbd-v2.19.1-darwin-arm64.tar.gz"
      sha256 "f2a1f70e7b1e16c79ddb4a263bdc27be51f49940ff6343e58cb0bf2f8af3df92"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.1/mddbd-v2.19.1-darwin-amd64.tar.gz"
      sha256 "a8d2bb8348f27ae77df1c70666a284761a2f90f4c90f58945befe63f24eb9481"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.1/mddbd-v2.19.1-linux-arm64.tar.gz"
      sha256 "c5c1bd0d944b2a093c0bb07442f0251b5bd3b7d8e14a722cfdb8316c4da97e7d"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.1/mddbd-v2.19.1-linux-amd64.tar.gz"
      sha256 "ef413393351b72a89f74c65d4d087fd9991c0ce54faa4050f6d669e9fce78595"
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
