# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.9.16"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.16/mddbd-v2.9.16-darwin-arm64.tar.gz"
      sha256 "373bb55783aae7c37923c068415ee769fd06dde9a0d40bf9354cd890458eec9e"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.16/mddbd-v2.9.16-darwin-amd64.tar.gz"
      sha256 "240c616d6c20f0207d543c020f6c559fdc5f6b33d488e9063e570b0deb7577bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.16/mddbd-v2.9.16-linux-arm64.tar.gz"
      sha256 "e5864ee06255c660392ff7c75c383d5a63f8e4e570b988bed4b94bbd3f069192"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.16/mddbd-v2.9.16-linux-amd64.tar.gz"
      sha256 "d3a7abdbfc38b4cfedbd07481514e63c5f45cf3ac8835a3a3cd06fc282b43f8f"
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
