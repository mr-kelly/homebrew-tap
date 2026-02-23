class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.8.1-alpha.35"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.35/mato-macos-aarch64-v0.8.1-alpha.35.tar.gz"
      sha256 "fb126298b12af4496d9f1e9ad9ced78697c4e16a03fa9c2797bbad1c5d2bfc4a"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.35/mato-macos-x86_64-v0.8.1-alpha.35.tar.gz"
      sha256 "661cc1aba9cabb3b0dcd37342edd5f0ef81e01267938f52c5859d2b254352f5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.35/mato-linux-aarch64-v0.8.1-alpha.35.tar.gz"
      sha256 "91616207d9490b3616fa45241f54e853efc9d9e7b22fe6e610926f2e47f46f5e"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.35/mato-linux-x86_64-v0.8.1-alpha.35.tar.gz"
      sha256 "0cb179bbaea8334ea473d55c204e80d7a32afd0f34febe1297c98c34c0bc4d7a"
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
