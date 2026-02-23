class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.8.1-alpha.37"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.37/mato-macos-aarch64-v0.8.1-alpha.37.tar.gz"
      sha256 "aceb987841ca62cbb2c3800637d8b2a6b77e03c7d3cb4b9e742c5df7372ca8db"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.37/mato-macos-x86_64-v0.8.1-alpha.37.tar.gz"
      sha256 "52c0259c71e5bbb84bb79693163a21deff85db877be4969e4c211dfffcfe0f14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.37/mato-linux-aarch64-v0.8.1-alpha.37.tar.gz"
      sha256 "8c413d542210d62b28598aa1423486c8b64ca5c39553955a6ff2d3e22fa7725a"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.8.1-alpha.37/mato-linux-x86_64-v0.8.1-alpha.37.tar.gz"
      sha256 "08f2cea867ea17013e68aabf95cb0cabba535d081ac89d86291d6ff80e585a7b"
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
