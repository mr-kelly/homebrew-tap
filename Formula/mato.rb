class Mato < Formula
  desc "Multi-Agent Terminal Office"
  homepage "https://github.com/mr-kelly/mato"
  version "0.7.1"
  license "MIT"
  conflicts_with "mato-alpha", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.1/mato-macos-aarch64-v0.7.1.tar.gz"
      sha256 "f213be190caf44c315882c71091ee5eedec5a1c28637fed7c2dd65c1aab85cba"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.1/mato-macos-x86_64-v0.7.1.tar.gz"
      sha256 "041cc2ff144530906b625a1745ea5629cc0d359199c96fb8287c5f1b9d62bec4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.1/mato-linux-aarch64-v0.7.1.tar.gz"
      sha256 "6d4aaf8930396b46dfbf9db6597d030d26e5680e3f4890a94c8cb2e94ac10681"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.1/mato-linux-x86_64-v0.7.1.tar.gz"
      sha256 "3acf56fe6dbfa5fb451dbfab5157d9f0355c9e220e2e3b8e99e626cd6c318dff"
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
