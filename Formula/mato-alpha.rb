class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.8.0-alpha.28"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.28/mato-macos-aarch64-v0.8.0-alpha.28.tar.gz"
      sha256 "0492b668a55e328543b9201356d2562acf57acc3da02c20490d8ce0d093c3c17"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.28/mato-macos-x86_64-v0.8.0-alpha.28.tar.gz"
      sha256 "ef9b3d45fe89f2b5e7376ce5b70bff65e2a25a1ccb24f08d6904da7177ebeaa9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.28/mato-linux-aarch64-v0.8.0-alpha.28.tar.gz"
      sha256 "51626d18b92b9978d9e7766d0df66fcb0cfa32e1e422e168069263117540367e"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.28/mato-linux-x86_64-v0.8.0-alpha.28.tar.gz"
      sha256 "de41f6baee489b7ceb7629ad742b0e7fe00f73a4658b6a85257b1142648af26a"
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
