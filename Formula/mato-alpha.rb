class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.0-alpha.43"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.43/mato-macos-aarch64-v0.9.0-alpha.43.tar.gz"
      sha256 "3ee249140e7261f5b13b4c62377061590a79f13771040fc85cc453f6b5a3b4b4"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.43/mato-macos-x86_64-v0.9.0-alpha.43.tar.gz"
      sha256 "48fe0a6e12363c520d5250dc9854175abc8a5963dd05ffddb811630d9b2249a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.43/mato-linux-aarch64-v0.9.0-alpha.43.tar.gz"
      sha256 "d32ee8f8b1c0299f8b82758d5d9c9e73ffbcae24edcb3406f72eb489993fa215"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.43/mato-linux-x86_64-v0.9.0-alpha.43.tar.gz"
      sha256 "349948104d4c2df34998ccdcb7de417e9a0b8f1d02fa8d0baeae78597f95f8fb"
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
