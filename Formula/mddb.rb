# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.10"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.10/mddbd-v2.19.10-darwin-arm64.tar.gz"
      sha256 "cbc36ee8b329470241e4151cb51e70617791e6be12813574246ffd283d9f3c11"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.10/mddbd-v2.19.10-darwin-amd64.tar.gz"
      sha256 "0fd9d8bc49b250ee8a9a5358ac1c851dca0fa1a48e847b3b867494c8244817e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.10/mddbd-v2.19.10-linux-arm64.tar.gz"
      sha256 "87be8553d1e5157e04f90f730ca2762715ca10c5231f2d36b85b35b5b9312688"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.10/mddbd-v2.19.10-linux-amd64.tar.gz"
      sha256 "f8b53625066018ec6527273665d8910a987501b2430a396f5f93c2b72943bf73"
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
