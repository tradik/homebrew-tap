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
      sha256 "72419c6b7725489c80467ccfa7ae9e936926eb9835445bcc9262e73122f3eac0"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddbd-v2.11.2-darwin-amd64.tar.gz"
      sha256 "f8d50d3336df0d0e34e5f0d436febe73a16ce78e03a40d9953edab803c70e06d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddbd-v2.11.2-linux-arm64.tar.gz"
      sha256 "e0f0acbe0aaf9f69c07ce502286ea1d5118e1c8e60634f9cdeafe123c5071522"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.2/mddbd-v2.11.2-linux-amd64.tar.gz"
      sha256 "f619b9f4fcd8b247277b734a05e18a24a70a3e10f9e06443d8570e0dabd2f7ff"
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
