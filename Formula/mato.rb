class Mato < Formula
  desc "Multi-Agent Terminal Office"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.0"
  license "MIT"
  conflicts_with "mato-alpha", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0/mato-macos-aarch64-v0.9.0.tar.gz"
      sha256 "c0f19ecc6ed8cd4ea8cc3d49af2da2039fc1d464f5ce0eed2b0fad88b1d75742"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0/mato-macos-x86_64-v0.9.0.tar.gz"
      sha256 "4b70b33911b4c050e65d285bde875f639c24f518b47e90bbb93719d479eff42f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0/mato-linux-aarch64-v0.9.0.tar.gz"
      sha256 "5e3c2efe38356491d7b6ba016ec82f89488d1c0420fae306e29e45486651bd63"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0/mato-linux-x86_64-v0.9.0.tar.gz"
      sha256 "30d02667b0c4a28e0b89771cc806557e04d9488bba26b9c8345e2f08b19c400e"
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
