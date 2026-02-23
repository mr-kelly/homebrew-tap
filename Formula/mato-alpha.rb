class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.5-alpha.61"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.61/mato-macos-aarch64-v0.9.5-alpha.61.tar.gz"
      sha256 "5f09dfc78976a906de477977f9ff0cf06c8e2f1ef969e0ca8603170bfbdcd27a"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.61/mato-macos-x86_64-v0.9.5-alpha.61.tar.gz"
      sha256 "81212eb5ec685b56436ec545c99cd0e1d2020fb6e009f91a1baa152f7e2173d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.61/mato-linux-aarch64-v0.9.5-alpha.61.tar.gz"
      sha256 "1d583ed13773c056637f6ecdc60798e58e20d1bcc3748672daea6fe5a1658c31"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.61/mato-linux-x86_64-v0.9.5-alpha.61.tar.gz"
      sha256 "7cc53f592c307c5a3988c7862fea97b679555d4e57aa71e5d18c59c48ab692e8"
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
