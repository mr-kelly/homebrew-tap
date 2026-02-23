class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.1-alpha.45"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.1-alpha.45/mato-macos-aarch64-v0.9.1-alpha.45.tar.gz"
      sha256 "dd6fcda3aff4551f0b2b43419cd5dc3c71688b5cb155978319471a2264b3e7a9"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.1-alpha.45/mato-macos-x86_64-v0.9.1-alpha.45.tar.gz"
      sha256 "f7d0b82569bb4510b97c6cf9537c5db1dee4254a4499213c37a9579ba9208976"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.1-alpha.45/mato-linux-aarch64-v0.9.1-alpha.45.tar.gz"
      sha256 "625476bb742d28c4be694d7bb6ad264c51346837a1f3904bb123abffc83179d6"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.1-alpha.45/mato-linux-x86_64-v0.9.1-alpha.45.tar.gz"
      sha256 "b87ca3e30d5fb07a0426df5dd3ce5804331a02d7d6a993020842d8ad75911756"
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
