class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.8.1-alpha.33"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.33/mato-macos-aarch64-v0.8.1-alpha.33.tar.gz"
      sha256 "6a1b240a540414a32d51febcd379d6d71e9b97a3a74672b32376d14ecd604b14"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.33/mato-macos-x86_64-v0.8.1-alpha.33.tar.gz"
      sha256 "ba788a39e735a244326f4958a88a608642c22042224de50865b70a20fe7d9f94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.33/mato-linux-aarch64-v0.8.1-alpha.33.tar.gz"
      sha256 "8db25fc410e50d286b8149544317cc32981fdfb27862aa1a119469ed4aab13ec"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.33/mato-linux-x86_64-v0.8.1-alpha.33.tar.gz"
      sha256 "de6b1d2badccd44e0bf13b6db7d5bb758aac8fb782fdedb1f6d836558bc6e8da"
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
