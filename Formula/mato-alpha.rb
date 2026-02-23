class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.2-alpha.48"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.48/mato-macos-aarch64-v0.9.2-alpha.48.tar.gz"
      sha256 "666aa8eb42c0bd11c43e608b78ac6abd98fdf3d7744f8367e48ac40ada4bceb7"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.48/mato-macos-x86_64-v0.9.2-alpha.48.tar.gz"
      sha256 "663bba909b3ad35b8ced0104b5a73e758af42014c2f94f460f9734fe21a8080c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.48/mato-linux-aarch64-v0.9.2-alpha.48.tar.gz"
      sha256 "7c49bf5174ec850e658c2f8f9d39acc18c413e838273d810d1312c82bf0ff412"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.48/mato-linux-x86_64-v0.9.2-alpha.48.tar.gz"
      sha256 "9a0d84e5acff910b466677643e5726c44c0fbed975e23bbeb5fd5a4fc240da7d"
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
