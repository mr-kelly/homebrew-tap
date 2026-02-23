class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.3-alpha.55"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.55/mato-macos-aarch64-v0.9.3-alpha.55.tar.gz"
      sha256 "e9a1458628e1726b3d1a558521a350d3a524d997464e5abe04c9f65cddf06960"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.55/mato-macos-x86_64-v0.9.3-alpha.55.tar.gz"
      sha256 "c9464a122d94161eb17a24d6d9a8d0aa257daa63b0c5a85d58796956a90254b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.55/mato-linux-aarch64-v0.9.3-alpha.55.tar.gz"
      sha256 "26b7076a82fa3eaeab64b2f747c0550cbaa6778a6fbd082e1539edd21616b0f6"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.3-alpha.55/mato-linux-x86_64-v0.9.3-alpha.55.tar.gz"
      sha256 "879685876987cb1a1c1da1af7ff9e492d387456241f3b241255ce0ae32acf04b"
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
