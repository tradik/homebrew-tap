# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.16.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.16.0/mddbd-v2.16.0-darwin-arm64.tar.gz"
      sha256 "16020906886f539b479533361e226969db8049d2fb426e28029dfbaf4a3b7707"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.16.0/mddbd-v2.16.0-darwin-amd64.tar.gz"
      sha256 "4b665af0abfec9f468690db3511346aca513ee61ef239cf83724e522b792bc3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.16.0/mddbd-v2.16.0-linux-arm64.tar.gz"
      sha256 "55578d8182412541adae97bb9ad470f663b5665bbc7a0baa9d70637f56b30ef4"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.16.0/mddbd-v2.16.0-linux-amd64.tar.gz"
      sha256 "403df3d04e2faf159e64c0f9b658600936158cbb6f99a45c947ca12458cf8ec2"
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
