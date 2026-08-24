# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.12.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.12.0/mddbd-v2.12.0-darwin-arm64.tar.gz"
      sha256 "4c863426718ca5b641da73030d61a62206667684b36cbfa509122b9c1583495a"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.12.0/mddbd-v2.12.0-darwin-amd64.tar.gz"
      sha256 "8bbf32b5b22628647a2d51b7284dacd14fd990e1b75113724cec807c7559ce35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.12.0/mddbd-v2.12.0-linux-arm64.tar.gz"
      sha256 "251b2843e973efa7b762fb8484d63566eb024179d1dd7e7a278ad9480645e627"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.12.0/mddbd-v2.12.0-linux-amd64.tar.gz"
      sha256 "1d37297c8710ece3d091140644f693ec6089289d138a90d1857fe4db0153f125"
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
