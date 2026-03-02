class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.1/freecode-macos-aarch64-v0.9.1.tar.gz"
      sha256 "28821a9e0d72169ab270e3f23e257b6990bc8c01eba9e5480d245bba84910597"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.1/freecode-macos-x86_64-v0.9.1.tar.gz"
      sha256 "6cb1396d72020274c69421808bfceb3aef5cca2205bcf441f23c220c35f15fbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.1/freecode-linux-aarch64-v0.9.1.tar.gz"
      sha256 "a1870c94ed0ca62084024fceee67fcb2cd4df4a818be36627542c183d017825e"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.1/freecode-linux-x86_64-v0.9.1.tar.gz"
      sha256 "f4fb0fb23143577e91b8b16fa01e2d87ac84f798ea66db8a37038ca3fbf4bf55"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
