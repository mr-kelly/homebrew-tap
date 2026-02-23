class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.0-alpha.44"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.44/mato-macos-aarch64-v0.9.0-alpha.44.tar.gz"
      sha256 "73183d5c58eda3533bf555ed58525032bc4b7ba1fd67bbd70211edfd2790596d"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.44/mato-macos-x86_64-v0.9.0-alpha.44.tar.gz"
      sha256 "be899747c91df8dd1a51f2f169100dcce02497ab417646b5181b482875e063cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.44/mato-linux-aarch64-v0.9.0-alpha.44.tar.gz"
      sha256 "083b1f04ca3196c709422bba092edc3505a1ce179b899d808c3656a682229933"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.44/mato-linux-x86_64-v0.9.0-alpha.44.tar.gz"
      sha256 "e36bd27643dccbb142ce14a5b5356c03de29a095034e2e3cd0e5f33cdfe5570b"
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
