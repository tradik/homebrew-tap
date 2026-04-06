# Homebrew formula for MDDB Panel - React admin UI served as static files
# Install: brew install tradik/tap/mddb-panel
# Or: brew tap tradik/tap && brew install mddb-panel

class MddbPanel < Formula
  desc "Admin panel for MDDB Markdown Database (static web UI)"
  homepage "https://github.com/tradik/mddb"
  version "2.9.2"
  license "MIT"

  url "https://github.com/tradik/mddb/releases/download/v2.9.2/mddb-panel-dist.tar.gz"
  sha256 "PLACEHOLDER_PANEL_SHA256"

  def install
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      MDDB Panel static files installed to:
        #{prefix}

      To serve the panel, point your web server or mddbd's --panel-dir flag to:
        #{prefix}

      If using with mddbd:
        mddbd --panel-dir #{prefix}
    EOS
  end

  test do
    assert_predicate prefix/"index.html", :exist?
  end
end
