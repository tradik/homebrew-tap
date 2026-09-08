# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.14.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.14.1/mddbd-v2.14.1-darwin-arm64.tar.gz"
      sha256 "a03641b933dba74314fde4645b30e11586af11cc27b0a8009bda011b37c247c5"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.14.1/mddbd-v2.14.1-darwin-amd64.tar.gz"
      sha256 "551e7932ed3692a9963e44d30e0dae2309c3243b0b625f4dd38e7472bb354997"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.14.1/mddbd-v2.14.1-linux-arm64.tar.gz"
      sha256 "6ac7411003e6dcf5959c39202619b7cb3acdc8372fa15cb846f8d39feb0b4af4"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.14.1/mddbd-v2.14.1-linux-amd64.tar.gz"
      sha256 "9710a3ed71ffa0d5a8462096421efb297e4199c6a4cc0064d6ff612fe05ac867"
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
