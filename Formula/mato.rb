class Mato < Formula
  desc "Multi-Agent Terminal Office"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.5"
  license "MIT"
  conflicts_with "mato-alpha", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5/mato-macos-aarch64-v0.9.5.tar.gz"
      sha256 "4f764953e7bfdc1d8d9fe6a290f2ebf65ad1bbf1b4145f192b92e9fa2ac7a42e"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5/mato-macos-x86_64-v0.9.5.tar.gz"
      sha256 "6e2e751ec6e4f50ca1c9201819265e3974c6660682a8985fe5283194a4db7860"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5/mato-linux-aarch64-v0.9.5.tar.gz"
      sha256 "cbfc0938b41426519fc8cbc7438e41c866e04d45a63c52fa8e94c551ef35c8ab"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5/mato-linux-x86_64-v0.9.5.tar.gz"
      sha256 "3d0c280b3245f362eee641bb5911f98bd2f19b6978203c6b3de0bfea99aad7b4"
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
