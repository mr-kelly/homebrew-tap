class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.0-alpha.40"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.40/mato-macos-aarch64-v0.9.0-alpha.40.tar.gz"
      sha256 "d37339f2dfd12791af5acbaa5f36752a539ef3b7f4d68a2caca256e83b49a539"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.40/mato-macos-x86_64-v0.9.0-alpha.40.tar.gz"
      sha256 "279ac0f14ae93ce8b933f402e3498402c984c65dd4d3098513414b425ab25cb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.40/mato-linux-aarch64-v0.9.0-alpha.40.tar.gz"
      sha256 "1b7d6447dda98e56579ab47db4d8763c2d0677c9a5838495851df65de44e8e90"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.40/mato-linux-x86_64-v0.9.0-alpha.40.tar.gz"
      sha256 "b51e25118d4829099ceade1c46ebfc700576dd906adf487fc68f959c15418fa3"
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
