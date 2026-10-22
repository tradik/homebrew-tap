# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.17.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.0/mddbd-v2.17.0-darwin-arm64.tar.gz"
      sha256 "6f50b2a20723bda41a9cefc67d660876a0991202a67957ec2ba96ea46adf437e"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.0/mddbd-v2.17.0-darwin-amd64.tar.gz"
      sha256 "5e3b34ca29b1e036ef1c2d5fb01e3e432b2e48a46c4558b308ece4dfa617f2a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.17.0/mddbd-v2.17.0-linux-arm64.tar.gz"
      sha256 "af22cb4453e0b60866f35174175bbf283840e9b85644f6ea4fa30aa6ed5ae58d"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.17.0/mddbd-v2.17.0-linux-amd64.tar.gz"
      sha256 "96a1594c28d9fccd7215839d924ac890d54af563e8ab9140fcb63cf7c0d4e3b8"
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
