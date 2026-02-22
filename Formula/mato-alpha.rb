class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.8.0-alpha.31"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.31/mato-macos-aarch64-v0.8.0-alpha.31.tar.gz"
      sha256 "1437decaf8281faa1f438eb9abb3f06066eac151e0fae2c4c6d1b89abab475a3"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.31/mato-macos-x86_64-v0.8.0-alpha.31.tar.gz"
      sha256 "771aa2ac1d229bfa5a41c1205cb0e2061bfa994397de1406a6bcb008589aa7d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.31/mato-linux-aarch64-v0.8.0-alpha.31.tar.gz"
      sha256 "f01bc5c11cdf3bf9c3d0371d48ded34c5edcbfc0aff1ab25799458c5bbf80f81"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.0-alpha.31/mato-linux-x86_64-v0.8.0-alpha.31.tar.gz"
      sha256 "c404d211e7beb10ad232f2b0dd0d27c145ea207c817c605bc137187b1e6d019f"
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
