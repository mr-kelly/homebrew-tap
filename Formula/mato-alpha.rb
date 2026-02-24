class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.5-alpha.62"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.62/mato-macos-aarch64-v0.9.5-alpha.62.tar.gz"
      sha256 "4c44cc70855792a318ae11729348dc2bb9391c609e596712df73f1e8b9fb7785"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.62/mato-macos-x86_64-v0.9.5-alpha.62.tar.gz"
      sha256 "03e390238b3072a8008c1e69a346f168972ee8868db97a9261bf17660e7ad2f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.62/mato-linux-aarch64-v0.9.5-alpha.62.tar.gz"
      sha256 "68778640557ce8088ae9f0007c99d16db2a8c01d0e77aa5fddddea0d77cb6faa"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.62/mato-linux-x86_64-v0.9.5-alpha.62.tar.gz"
      sha256 "33455572e92d7aae03618f396d1bad67c307a4fbb751e31baad6834d1a0c9671"
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
