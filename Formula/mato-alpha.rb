class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.7.0-alpha.24"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.0-alpha.24/mato-macos-aarch64-v0.7.0-alpha.24.tar.gz"
      sha256 "c40d9931d8337a981ed3d34fa346c1df4e990c213d4501c833c352eb393aaf91"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.0-alpha.24/mato-macos-x86_64-v0.7.0-alpha.24.tar.gz"
      sha256 "5d4fcecb2d060241102404653a6a572d0372c0eaa62ad6f0f46473bc3b61019e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.0-alpha.24/mato-linux-aarch64-v0.7.0-alpha.24.tar.gz"
      sha256 "92e17d0255d6390752e3bbc704e76fdb7d49e2fb13db43ab8a5f995746f930ce"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.7.0-alpha.24/mato-linux-x86_64-v0.7.0-alpha.24.tar.gz"
      sha256 "50c68c5f403378b87eb777789743826e6628b99ca63a6d57313d2a3dc5f909fd"
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
