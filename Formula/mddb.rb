# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.19.2"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.2/mddbd-v2.19.2-darwin-arm64.tar.gz"
      sha256 "b51990cf082999a8f729b349a56529e9c4c205e3e8f3f07517ad85cb97be7eec"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.2/mddbd-v2.19.2-darwin-amd64.tar.gz"
      sha256 "85eab86f76f0f96749d785c5953b6e51880f405ede9b592b40d637d1c8c036b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.19.2/mddbd-v2.19.2-linux-arm64.tar.gz"
      sha256 "a9c3c172310be6f6e589050b10026b80a695818afb6ea026552ddba649a24e77"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.19.2/mddbd-v2.19.2-linux-amd64.tar.gz"
      sha256 "92426884418958addc59f000ab86476e884aad45b58a5ff888c4ebc809a80bb7"
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
