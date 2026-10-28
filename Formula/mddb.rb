# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.7"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.7/mddbd-v2.18.7-darwin-arm64.tar.gz"
      sha256 "bdf7c138ef6e8a4f7a287d461e3023a5d2cc210920aaf9cf5c8544600d60dc25"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.7/mddbd-v2.18.7-darwin-amd64.tar.gz"
      sha256 "afa8f29a05b6ee1af9dcd3a693dcb3d4e4a38c339d95e7f41ac795449a1fc545"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.7/mddbd-v2.18.7-linux-arm64.tar.gz"
      sha256 "235ce78ac985b173e7546a7cf31c4eec780d37f255f0cdb34d9d5b6432e4e260"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.7/mddbd-v2.18.7-linux-amd64.tar.gz"
      sha256 "8d04ae404b7858257da79013fdab922f68478d4788267805d8d7ab65d06d9c7e"
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
