class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.5.1-alpha.15"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.15/mato-macos-aarch64-v0.5.1-alpha.15.tar.gz"
      sha256 "b045b75ba8138b9e03886e9a9c2d5ecbc3c57e49dbdf344ce06e6ea46e6e69b8"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.15/mato-macos-x86_64-v0.5.1-alpha.15.tar.gz"
      sha256 "53929292d6a4695cf0c7427f62e537d266c426d69bc169c966b44856c891ac70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.15/mato-linux-aarch64-v0.5.1-alpha.15.tar.gz"
      sha256 "ce386ada2d625fbb043d23de06b93dc0d4c728e0367dae908509c3f21429302f"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.15/mato-linux-x86_64-v0.5.1-alpha.15.tar.gz"
      sha256 "9b9fc5715dd7b84a8179aa51ab3166d31852cbe43e608d290dcee68053d475ca"
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
