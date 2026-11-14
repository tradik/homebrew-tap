# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.3"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.3/mddbd-v2.19.3-darwin-arm64.tar.gz"
      sha256 "a60df048f69ac0b7ce5a67c56b650d9e6a7385130f84a4e59d4154389c3ccff1"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.3/mddbd-v2.19.3-darwin-amd64.tar.gz"
      sha256 "c7dd8056d7302a12dc6de80f34403311fb81f8e6f89b0592eaca1179e719687d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.3/mddbd-v2.19.3-linux-arm64.tar.gz"
      sha256 "41b26b791948c6e85e4899d90ce7aa6e0d507ac0a33178832ad6b0305e2936b9"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.3/mddbd-v2.19.3-linux-amd64.tar.gz"
      sha256 "8132eaac6fb4579c7b31965d953183072918d644411f5130ff2c6b4ed867c2ea"
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
