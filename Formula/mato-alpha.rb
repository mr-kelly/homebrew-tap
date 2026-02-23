class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.3-alpha.58"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.58/mato-macos-aarch64-v0.9.3-alpha.58.tar.gz"
      sha256 "360bbd25bb57b33531a3375bb689e2504e0b30f3b800f25d36376efd2734aade"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.58/mato-macos-x86_64-v0.9.3-alpha.58.tar.gz"
      sha256 "5ff46a24e4d6739e1d5a11e6989d594aeaec960b22d48451a32b0844f0676267"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.58/mato-linux-aarch64-v0.9.3-alpha.58.tar.gz"
      sha256 "0edc4a1ccd7338dd8c7e6485bf5309fc1e0e0f42b64c6c6e1b25746d5aab097e"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.58/mato-linux-x86_64-v0.9.3-alpha.58.tar.gz"
      sha256 "6e0a388bed6cf9a65ed9b9a23c789a3ed3212d813cbaccdfe2a3f531a1aadcb4"
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
