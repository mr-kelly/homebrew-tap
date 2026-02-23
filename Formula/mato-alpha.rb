class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.2-alpha.53"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.53/mato-macos-aarch64-v0.9.2-alpha.53.tar.gz"
      sha256 "cf9ae67da3968ca08ec8ee7b9bb88d4b0fdb07025d5761658ec12c16f5fb3314"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.53/mato-macos-x86_64-v0.9.2-alpha.53.tar.gz"
      sha256 "cc96ebdab407792a799a0ddc69ae195a3bd7cd44ca0a013c52755df74134bc4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.53/mato-linux-aarch64-v0.9.2-alpha.53.tar.gz"
      sha256 "9f19e0ebeb19c63d1f56af2be6695050f38d89d9cc755059e01a19fe1643f34e"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.53/mato-linux-x86_64-v0.9.2-alpha.53.tar.gz"
      sha256 "625cfb9400624428f68abc276e920bdf4cbd7bb65e39d64e42d96ce81ee9bd61"
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
