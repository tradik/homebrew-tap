# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.6"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.6/mddbd-v2.18.6-darwin-arm64.tar.gz"
      sha256 "f4c6debefae4e002e51a437c586ee48758baec95425f270031446ebe7c9296f8"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.6/mddbd-v2.18.6-darwin-amd64.tar.gz"
      sha256 "fb4eb25aafcbebb3ddc5da7e4658bef7cb17545dc9c2b1bb21276863769555e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.6/mddbd-v2.18.6-linux-arm64.tar.gz"
      sha256 "3a206017b083a3aba67161ca611d920a0a459cad35907123bad7dc71bc040bea"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.6/mddbd-v2.18.6-linux-amd64.tar.gz"
      sha256 "53bf21d3760c5049b7f28fa0cbf45fe59e591a9583cb58ccc3f6b24c92dd9e18"
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
