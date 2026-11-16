# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.8"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.8/mddbd-v2.19.8-darwin-arm64.tar.gz"
      sha256 "77c04dead86233a429d6e02eab1187d8c4dbf6d6893bb2a66d0f3680d6ca8728"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.8/mddbd-v2.19.8-darwin-amd64.tar.gz"
      sha256 "6d1850d87d849e212bc25fcbcbf4b6e5bf7274914c1a23d2acb664776e84fb27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.8/mddbd-v2.19.8-linux-arm64.tar.gz"
      sha256 "1a0a05ad48f455b3c997d3534cf744215d26e795b2130135816f9636b8f06d12"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.8/mddbd-v2.19.8-linux-amd64.tar.gz"
      sha256 "f69a0499bd9d0ff686ad93207e0e84d8efc90e9eb9acf43f0020cec2868602c6"
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
