class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.5.1-alpha.14"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.14/mato-macos-aarch64-v0.5.1-alpha.14.tar.gz"
      sha256 "00833f78d91532b56ffde112e3d89c782fc03b00ffd13a1cc2ed4693cea25e48"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.14/mato-macos-x86_64-v0.5.1-alpha.14.tar.gz"
      sha256 "14346491bb2486606921959c318ea44ecaa8af446df20650f288751500975e47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.14/mato-linux-aarch64-v0.5.1-alpha.14.tar.gz"
      sha256 "9ef3292689659cfa3b94147fae6f4095aa9be3d9a22b28c55d9fd82b8c083d17"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.14/mato-linux-x86_64-v0.5.1-alpha.14.tar.gz"
      sha256 "2114a4ebfad04ad90615ac5e682864acaa2894333586269aa32a40e38cd3deb7"
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
