# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.9"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.9/mddbd-v2.18.9-darwin-arm64.tar.gz"
      sha256 "58238810eb0a34c9dc83e04a445a257a3824470433906f1a4808b894c6c9f3e5"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.9/mddbd-v2.18.9-darwin-amd64.tar.gz"
      sha256 "a3bfb5616b1d6e9302c716ee08cd401655454330d5afc616f4d25246c569c0b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.9/mddbd-v2.18.9-linux-arm64.tar.gz"
      sha256 "4b643332d9f1e2fee0e06f6489ee32768551696e822069ce39f04a3c0a03e1e6"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.9/mddbd-v2.18.9-linux-amd64.tar.gz"
      sha256 "c231df2087a8ec161ddcd12be1298c85c4f37cd0352f4def9b5d01a3d67410f1"
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
