# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.17.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.1/mddbd-v2.17.1-darwin-arm64.tar.gz"
      sha256 "9d88dcaba5f047b90ed710b1e067daa0ec56b1481549cdcf53de5cb208ce0802"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.1/mddbd-v2.17.1-darwin-amd64.tar.gz"
      sha256 "540268c72a3990ea6ac38346349afe1c5f6f5c2b1dd82902d8fc6f2700619322"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.1/mddbd-v2.17.1-linux-arm64.tar.gz"
      sha256 "13a21926bbf21ef73a612ee917a500c0e38fb7cb96b77fd8ae8c28790aea4421"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.1/mddbd-v2.17.1-linux-amd64.tar.gz"
      sha256 "5c1ba068b3282793c5fe36e1f9618e590a582ff3698049ad9fb705cc0fc7985c"
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
