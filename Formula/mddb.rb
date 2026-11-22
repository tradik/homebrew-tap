# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.13"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.13/mddbd-v2.19.13-darwin-arm64.tar.gz"
      sha256 "cd2a19abd1c9692a1224eaf86c5948ee8948da28f22dfccd879e137e5edd4056"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.13/mddbd-v2.19.13-darwin-amd64.tar.gz"
      sha256 "4ca22b22c3e0df7c903ccba2157c413cac28be62364b4f5b7d6a95fa9f80cb73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.13/mddbd-v2.19.13-linux-arm64.tar.gz"
      sha256 "29243893fc173c96ca51690377852f5852455fdeb7344f82a8072385d73e3aa3"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.13/mddbd-v2.19.13-linux-amd64.tar.gz"
      sha256 "53ebb2504b66d95d26d4a4d0e642cd3929ec3294debb02e4073ef15910af61a6"
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
