class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.5.1-alpha.18"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.18/mato-macos-aarch64-v0.5.1-alpha.18.tar.gz"
      sha256 "38b902aa36b8e5639499226f64be85943b32abc96f5f65abd5c8cb9329c2c2f0"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.18/mato-macos-x86_64-v0.5.1-alpha.18.tar.gz"
      sha256 "21ddd48ad3d7924d6d2e59c9407b5be88b5fd5517c989763f23805a4efff6d6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.18/mato-linux-aarch64-v0.5.1-alpha.18.tar.gz"
      sha256 "ddaf412e4de9e9eef544ce6aacf69487aa15da324e739239cfbf1e8ecb874288"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.18/mato-linux-x86_64-v0.5.1-alpha.18.tar.gz"
      sha256 "d75f42733bf6e0c1aec8ffb7b5e5f2a76b71805a7e3f9af45b44dca35283caae"
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
