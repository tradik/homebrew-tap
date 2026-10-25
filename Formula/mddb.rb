# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.18.4"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.4/mddbd-v2.18.4-darwin-arm64.tar.gz"
      sha256 "8c1c26e89199f32ed8de2696a0459a30105acc187ffb5f80042bdadf1752c548"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.4/mddbd-v2.18.4-darwin-amd64.tar.gz"
      sha256 "b07ef583940168ee83d909eae1f4d9dc9a66ecd0932c38ebcd996005c2f5b941"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.18.4/mddbd-v2.18.4-linux-arm64.tar.gz"
      sha256 "06515bc73f1c506576af4bb8ab7e9d509e5dd4014196f5c44870f14e607e0a79"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.18.4/mddbd-v2.18.4-linux-amd64.tar.gz"
      sha256 "3944215f8caa06c7cef34b57fdcd5008c76ab53971afa3b4452bd19c163f0def"
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
