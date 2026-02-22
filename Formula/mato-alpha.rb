class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.5.1-alpha.17"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.17/mato-macos-aarch64-v0.5.1-alpha.17.tar.gz"
      sha256 "2b4af19c6e7c67d2ffb64d058460043c309f35800bc4900f49c15f4ce2113677"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.17/mato-macos-x86_64-v0.5.1-alpha.17.tar.gz"
      sha256 "ef3e077a2b2748d1803c1179c52e4de3cf44996f61f3510dc3e64127a749f70d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.17/mato-linux-aarch64-v0.5.1-alpha.17.tar.gz"
      sha256 "9f16e94b4ec8e386023195d9187b3bdd0746886434d85798c4691bd7e712b5fd"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.1-alpha.17/mato-linux-x86_64-v0.5.1-alpha.17.tar.gz"
      sha256 "0744fdf40cdfdb26e03b8980875e2c1405a84b02968373515c24212a7eccd2ce"
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
