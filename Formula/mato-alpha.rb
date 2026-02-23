class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.0-alpha.39"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.39/mato-macos-aarch64-v0.9.0-alpha.39.tar.gz"
      sha256 "d2405b93243f996c3f729ba2ae9466e0873add14db0150b186c52ce5a7b0ccfc"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.39/mato-macos-x86_64-v0.9.0-alpha.39.tar.gz"
      sha256 "445648d0dd18a17ff451e16e57a7cd5bcc1a175e1db0cc76f80d6336ba107456"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.39/mato-linux-aarch64-v0.9.0-alpha.39.tar.gz"
      sha256 "1e4a7ade546b2155c8e14de8217e533aed655073343984be5913d855b68de68f"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.39/mato-linux-x86_64-v0.9.0-alpha.39.tar.gz"
      sha256 "8741dbbb6bc72c2a45cede8418244a727b7ec6a352590af7437ffaf3b7b2c0de"
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
