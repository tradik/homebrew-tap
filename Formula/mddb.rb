# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.14.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.14.0/mddbd-v2.14.0-darwin-arm64.tar.gz"
      sha256 "02fe4349113675fd6b2c60122871a457e88f667f191d68ee82a6bf0d11118bb2"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.14.0/mddbd-v2.14.0-darwin-amd64.tar.gz"
      sha256 "7f874514bd8d18bf232dee72106557f93703e689fd420ab5865929304b16d872"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.14.0/mddbd-v2.14.0-linux-arm64.tar.gz"
      sha256 "4ce0a73b719fc42e857142b36b3890faa2daaeaeaacb12a77edcfa32ceb9f3d0"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.14.0/mddbd-v2.14.0-linux-amd64.tar.gz"
      sha256 "c0bf5c78ddaf88458dd869e07bd3c2ed4670359b6f709b1a27dadfd9a1793be9"
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
