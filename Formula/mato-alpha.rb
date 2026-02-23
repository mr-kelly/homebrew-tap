class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.3-alpha.56"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.56/mato-macos-aarch64-v0.9.3-alpha.56.tar.gz"
      sha256 "60e9a97c0f763ed736e89d74d2af6d0a9bf2e53e822244998c121c014518aeea"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.56/mato-macos-x86_64-v0.9.3-alpha.56.tar.gz"
      sha256 "513e07a4967810001a9fb3b1723d92c9cb912b14ddff345d221c99f5df7e1aa2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.56/mato-linux-aarch64-v0.9.3-alpha.56.tar.gz"
      sha256 "1dc09f863a74d74e5d8ddfdc28aea53b33557cc9f3db29ff00cac530f0626c7f"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.56/mato-linux-x86_64-v0.9.3-alpha.56.tar.gz"
      sha256 "7ac47c2cc743f477ee2d6612ce885fad92be8e0f5c14bedb7c0a488ba843ed3f"
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
