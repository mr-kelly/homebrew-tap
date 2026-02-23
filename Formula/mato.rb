class Mato < Formula
  desc "Multi-Agent Terminal Office"
  homepage "https://github.com/mr-kelly/mato"
  version "0.8.1"
  license "MIT"
  conflicts_with "mato-alpha", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1/mato-macos-aarch64-v0.8.1.tar.gz"
      sha256 "7c42c93d527c11522e3515741516e4f1e617df0bd066f46a1e96775bdaaefdc9"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1/mato-macos-x86_64-v0.8.1.tar.gz"
      sha256 "5f2aeea027d81149a447b37ce5515967e489b68d02f43d1526e3855494daf73f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1/mato-linux-aarch64-v0.8.1.tar.gz"
      sha256 "08d77ac7d26417f0d420269a4427e71ddd02c1e92ab76ef39104b68cd168acf8"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1/mato-linux-x86_64-v0.8.1.tar.gz"
      sha256 "d1d38f50c746f7e76741e0a2d190bb147fb2620f4988a2483f2b836fcb9d163a"
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
