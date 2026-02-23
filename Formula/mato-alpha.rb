class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.2-alpha.49"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.49/mato-macos-aarch64-v0.9.2-alpha.49.tar.gz"
      sha256 "de73c78ff6cfde606989d637882643c8aebf4b4bdf0e7ba7e8d576914cf86c68"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.49/mato-macos-x86_64-v0.9.2-alpha.49.tar.gz"
      sha256 "dc6540d73e6c572c178d3c868fff41a8362f940d82c795baaa83097037ae5831"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.49/mato-linux-aarch64-v0.9.2-alpha.49.tar.gz"
      sha256 "92e981958d0fbd4ae2847651fa99c2594dc72e5aa9c827314c9ffea2ebf61522"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.49/mato-linux-x86_64-v0.9.2-alpha.49.tar.gz"
      sha256 "21720c34276a5c879202a8b35fd5624b5e86f9a24a20139915306fdbd7d51efc"
    end
  end

  def install
    bin.install "mato"
  end

  def caveats
    <<~EOS
      If you installed mato by another method (for example: install.sh to ~/.local/bin),
      your shell may still resolve that binary first.

      Check command priority with:
        which -a mato
    EOS
  end

  test do
    assert_match "mato", shell_output("#{bin}/mato --version")
  end
end
