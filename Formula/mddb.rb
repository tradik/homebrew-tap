# Homebrew formula for MDDB - Markdown Database Server
# Install: brew install tradik/tap/mddb
# Or: brew tap tradik/tap && brew install mddb

class Mddb < Formula
  desc "Embedded Markdown database server with REST, gRPC, GraphQL and vector search"
  homepage "https://github.com/tradik/mddb"
  version "2.16.1"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.16.1/mddbd-v2.16.1-darwin-arm64.tar.gz"
      sha256 "36bd5100a1829ef3bf8381ec0645d917e0fc7cc2121105ce4b04721e248c8229"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.16.1/mddbd-v2.16.1-darwin-amd64.tar.gz"
      sha256 "fe38d415433d5f7e78725c13258c68a6f4048f239d6d79d0854d70904cec5684"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tradik/mddb/releases/download/v2.16.1/mddbd-v2.16.1-linux-arm64.tar.gz"
      sha256 "51192a22bc74e2210b9d66b11df0d9824c7fc72b0b6b70f4a1359567b1c9e220"
    end
    on_intel do
      url "https://github.com/tradik/mddb/releases/download/v2.16.1/mddbd-v2.16.1-linux-amd64.tar.gz"
      sha256 "f3ac8761961aa157bbe01198e61b95c9f58036ed15cbfd678754e67ad4435b7a"
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
