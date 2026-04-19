# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.9.14"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.14/mddbd-v2.9.14-darwin-arm64.tar.gz"
      sha256 "86c10f8b95c8f11f536e6110e7b83b750fa52ceca4039ed14ab161692adb457e"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.14/mddbd-v2.9.14-darwin-amd64.tar.gz"
      sha256 "ac89f335f4a8939180b59d32279957d1d6fe4ff87320560a7f59f3c7894e1135"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.9.14/mddbd-v2.9.14-linux-arm64.tar.gz"
      sha256 "a977995789d21b04643890f7c54fece895c42c33d44cb1c9c68716ba70932227"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.9.14/mddbd-v2.9.14-linux-amd64.tar.gz"
      sha256 "f578bc454be02ab53b156f66222003955fba33186c43f6d766473792582f8e68"
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
