# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.10.2"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.10.2/mddbd-v2.10.2-darwin-arm64.tar.gz"
      sha256 "f8ab9ff4b72ba42e1b1b83f7eed4547803068cdedc2a7968c2dc323db04e11f3"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.10.2/mddbd-v2.10.2-darwin-amd64.tar.gz"
      sha256 "347659c268230a4e54d7c1d482771887795e0e28344ed87e3f93ed444e91ca50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.10.2/mddbd-v2.10.2-linux-arm64.tar.gz"
      sha256 "33a58428152f159fc34511b2d4de590e864fbe1f014b78e01aa4f07f3d4564b2"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.10.2/mddbd-v2.10.2-linux-amd64.tar.gz"
      sha256 "7e30bee079a7b9281b0815dacdf0303a00203e8dbb4725916ee7e950b7145603"
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
