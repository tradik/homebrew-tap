# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.9.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.9/mddbd-v2.9.9-darwin-arm64.tar.gz"
      sha256 "2888807d7cde1002f5412977a6eee2276f07d9ec569eac9932fd802bc1ab36cf"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.9/mddbd-v2.9.9-darwin-amd64.tar.gz"
      sha256 "5336529e110360518e53790654dd6bbd8254bbbd84b701b0a6f51c6955015b71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.9/mddbd-v2.9.9-linux-arm64.tar.gz"
      sha256 "2ee276344653b255c1cd67a5c08db5407fd8527f7bdc602cb4bcbc825296ca98"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.9/mddbd-v2.9.9-linux-amd64.tar.gz"
      sha256 "9ef31df9f625069991c9c8038d2b8f20c4542cc666e79e09b3cdb474eb9c73bf"
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
