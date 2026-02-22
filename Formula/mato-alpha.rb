class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.7.1-alpha.26"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.1-alpha.26/mato-macos-aarch64-v0.7.1-alpha.26.tar.gz"
      sha256 "3f85534d889c7cd9a1c50eff5dcdf24e48eb573b00a55401b1f40001fa50ab23"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.1-alpha.26/mato-macos-x86_64-v0.7.1-alpha.26.tar.gz"
      sha256 "65104dd8efd9304ce75981455009038222a9b16f69b20e81b8977763791e6cfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.1-alpha.26/mato-linux-aarch64-v0.7.1-alpha.26.tar.gz"
      sha256 "276d989d4f631b36a0fc5bf007012f7a274caa4c2fbe11d34d4de3bec9257bd1"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.1-alpha.26/mato-linux-x86_64-v0.7.1-alpha.26.tar.gz"
      sha256 "918e8c93e06af9580e2e8d4f954c67915df47b722f719ac6458579a236c8197f"
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
