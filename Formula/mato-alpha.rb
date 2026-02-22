class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.8.0-alpha.29"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.29/mato-macos-aarch64-v0.8.0-alpha.29.tar.gz"
      sha256 "0d56a6659774fa24fa184f4cfd3e75cd880f0695bce015825fb9c0034211181f"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.29/mato-macos-x86_64-v0.8.0-alpha.29.tar.gz"
      sha256 "6fbe91d756fb3b93d3455b06e110b4d70e6a995c9a1a794c8d4ff28f264ad374"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.29/mato-linux-aarch64-v0.8.0-alpha.29.tar.gz"
      sha256 "7ab6a7a59e1be225eebe95f77ed98789e18739585ec840698a5bbdef0cf51674"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.29/mato-linux-x86_64-v0.8.0-alpha.29.tar.gz"
      sha256 "d1b1053ee9d1f75b777a50227723bf5f163039ba21d509ac52a5ac6a871859e9"
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
