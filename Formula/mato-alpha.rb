class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.8.0-alpha.30"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.30/mato-macos-aarch64-v0.8.0-alpha.30.tar.gz"
      sha256 "496e12519d8d851afeab0a807792d1896e2acdee81a94abf5877bf2c8c8c1a74"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.30/mato-macos-x86_64-v0.8.0-alpha.30.tar.gz"
      sha256 "e17a0540c31196ffc4a741bedff69a555767eb4b245e6027858a2c28e98248d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.30/mato-linux-aarch64-v0.8.0-alpha.30.tar.gz"
      sha256 "a627565e0bb6eac45267faf294d17223d16940409dc130287191835ea6cf50c6"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.30/mato-linux-x86_64-v0.8.0-alpha.30.tar.gz"
      sha256 "86fdcbf21a6098d5b4be1ef45c0a6e72c2b9ed508262842691c39f22884345c4"
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
