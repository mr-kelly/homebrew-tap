class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.2-alpha.50"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.50/mato-macos-aarch64-v0.9.2-alpha.50.tar.gz"
      sha256 "2a7449079c6e5df46404d15f7c5b8da78c21022bef321f4932f17165baf9628d"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.50/mato-macos-x86_64-v0.9.2-alpha.50.tar.gz"
      sha256 "ed4671ed850d803a6108102b0f933e0d4c883777186a1123b993b583dd11f0c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.50/mato-linux-aarch64-v0.9.2-alpha.50.tar.gz"
      sha256 "75c15f0aa879e758b873f53d371d9315639c58958e0e90af5d541cd1fca161de"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.50/mato-linux-x86_64-v0.9.2-alpha.50.tar.gz"
      sha256 "4168b98ca524b137a3c733fe9988f077c229b5c7336a5daa8793c34f5744cbe3"
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
