# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.9.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.6/mddbd-v2.9.6-darwin-arm64.tar.gz"
      sha256 "95873fc448a24b18fbaee8a933517a63144695176ac9f3efd4ad338131e6139e"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.6/mddbd-v2.9.6-darwin-amd64.tar.gz"
      sha256 "81ddda20c3f20681fd4a7f383600cef2c20e6961577e0b6bbdd2ba802d73356e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.6/mddbd-v2.9.6-linux-arm64.tar.gz"
      sha256 "b9913c4d40240f4d672d84ccd7d9f41fea0ba4d9b71e08271c8c313eaef0a6aa"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.6/mddbd-v2.9.6-linux-amd64.tar.gz"
      sha256 "7b1a6a2b97f5e519e73b9ca904c4770c5e763a1921c254b495b8fd89cc4d27a3"
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
