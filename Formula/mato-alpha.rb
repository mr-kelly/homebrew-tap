class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.5.0-alpha.13"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.13/mato-macos-aarch64-v0.5.0-alpha.13.tar.gz"
      sha256 "9ea5cdc614c2cdfe3196085898d0e40031d194c05880f8753fa1d72b403b0b03"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.13/mato-macos-x86_64-v0.5.0-alpha.13.tar.gz"
      sha256 "94289f28a2c1a8c43b8696e3f329fbb32db956b06f7399b483688da71c079ed5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.13/mato-linux-aarch64-v0.5.0-alpha.13.tar.gz"
      sha256 "f5e33680a459a5d1b712db7c757135c0accde79f5149ef51ef3f093228415bef"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.13/mato-linux-x86_64-v0.5.0-alpha.13.tar.gz"
      sha256 "0cf3cda6999b2f495d31c0ef1b4011c1c4c5417afbe32e494791577f7c662a5c"
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
