# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.13.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.13.0/mddbd-v2.13.0-darwin-arm64.tar.gz"
      sha256 "cfe8d4dd14920e25a1e74117645fff6a139a6e5457f6a51b4bb8560de8ab391f"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.13.0/mddbd-v2.13.0-darwin-amd64.tar.gz"
      sha256 "02d4025d9ec1274bac38fde71e522828ffc82de64c7bd816484564bc883757a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.13.0/mddbd-v2.13.0-linux-arm64.tar.gz"
      sha256 "5b6dc3c6b18d76f8cf2da8f99f40d60383d048da3ecdb934e11ce26cc1725b8e"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.13.0/mddbd-v2.13.0-linux-amd64.tar.gz"
      sha256 "7af78e00b693437ba226efe4321c7b6fa79d77aab1c5ef72e32e20b273e4148c"
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
