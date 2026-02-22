class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.7.0-alpha.22"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.0-alpha.22/mato-macos-aarch64-v0.7.0-alpha.22.tar.gz"
      sha256 "932f12cbef53a75a6f03acf0e022a965e8d9dcddd5eeaeaf8c0ec2c6a2987941"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.0-alpha.22/mato-macos-x86_64-v0.7.0-alpha.22.tar.gz"
      sha256 "e83b2e11a2e3e7996f1cb9ceca7b1883024f5744b3e00e4160400bf8ca0b6b5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.0-alpha.22/mato-linux-aarch64-v0.7.0-alpha.22.tar.gz"
      sha256 "b8511d7a607c14b24eceb38401338be1c6a52556a46e3e92042307d50484bcb3"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.0-alpha.22/mato-linux-x86_64-v0.7.0-alpha.22.tar.gz"
      sha256 "1ef270a4aa729712676d9cdc4cf438ea517ed1c2a125acdaf33363ac3d89bcfe"
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
