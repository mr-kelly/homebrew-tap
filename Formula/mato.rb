class Mato < Formula
  desc "Multi-Agent Terminal Office"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.3"
  license "MIT"
  conflicts_with "mato-alpha", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3/mato-macos-aarch64-v0.9.3.tar.gz"
      sha256 "c8fd7ac40f1b5b76596d8d8e05ae0ae67f1bc57ec1a03202092d4841c38e7936"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3/mato-macos-x86_64-v0.9.3.tar.gz"
      sha256 "79c3b0f34f2bd8aaa632ea48f7a46561a31af07a81f17791461519174632580f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3/mato-linux-aarch64-v0.9.3.tar.gz"
      sha256 "8f320e2d49a19be9d87a3f52bb57546eee759fbf59f27704a50b300fb8c2d53e"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3/mato-linux-x86_64-v0.9.3.tar.gz"
      sha256 "56c4759f06e49649aa9841f09eeb1cb3f4bcbcbc97205cc873ea3c36ae9aef25"
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
