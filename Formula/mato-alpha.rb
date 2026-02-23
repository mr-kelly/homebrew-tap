class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.3-alpha.54"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.54/mato-macos-aarch64-v0.9.3-alpha.54.tar.gz"
      sha256 "2ad57bf812c806f210fc7cd761ef5482141cb96356a3f97a5d10f728ef048507"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.54/mato-macos-x86_64-v0.9.3-alpha.54.tar.gz"
      sha256 "5ced75f78833337f56665c14de93fde4a18f40f4e99632b3010886f2c2a011dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.54/mato-linux-aarch64-v0.9.3-alpha.54.tar.gz"
      sha256 "d829e5c24303914b7f842e7e5cc82e11cabaca6fff36b7070ef98f2ee0445339"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.54/mato-linux-x86_64-v0.9.3-alpha.54.tar.gz"
      sha256 "b2405589df188aebd0d4bafcc01cbba78e35f3856aa2f392e662c778b6b2196b"
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
