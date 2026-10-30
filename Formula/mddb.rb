# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.10"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.10/mddbd-v2.18.10-darwin-arm64.tar.gz"
      sha256 "2dcf0344be62e9331c9d7f111b560b06cf676b080afe7deaa73a9ab9ba0456b2"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.10/mddbd-v2.18.10-darwin-amd64.tar.gz"
      sha256 "eaa861c7fc9fe4f7a318ba09f13cfacb8576e72b8ef54ea42840526bd02d5e68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.10/mddbd-v2.18.10-linux-arm64.tar.gz"
      sha256 "8c82b21e4ba52a4f2fcb200016cef8f07f0802a3ee50ce83b2d49a5532e13112"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.10/mddbd-v2.18.10-linux-amd64.tar.gz"
      sha256 "2c6879d5a3d8987c6e267226b749984faead5475eb975a72f441d3291c2f8b7b"
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
