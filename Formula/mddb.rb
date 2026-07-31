# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.11.4"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddbd-v2.11.4-darwin-arm64.tar.gz"
      sha256 "a41d666baad0005f837a071e943ffc07dc48a1b7b2197d7e1fd072cd6f52b229"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddbd-v2.11.4-darwin-amd64.tar.gz"
      sha256 "71f878ba285cff91bd14e5bec01d7aa91fabce4c0b41390bc18352c5c97efd71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddbd-v2.11.4-linux-arm64.tar.gz"
      sha256 "36f5938a89a8e4863f8577e201d00c4cf0ec64df2c5ebdd0371308c17b6d42ec"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.11.4/mddbd-v2.11.4-linux-amd64.tar.gz"
      sha256 "a725e07c7e96c0c3aa3eba35bb0ce58f37daf6545f8a1275b198c743cff48f02"
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
