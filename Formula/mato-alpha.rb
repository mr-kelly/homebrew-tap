class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.2-alpha.46"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.46/mato-macos-aarch64-v0.9.2-alpha.46.tar.gz"
      sha256 "796333d2613dff6490d420c4f820469218aab5738f16c05e8f52bde593f09a8c"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.46/mato-macos-x86_64-v0.9.2-alpha.46.tar.gz"
      sha256 "664648e246ccf8572f73e81ffbfabd9f76871943547d994c5e0d94f81de6c5b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.46/mato-linux-aarch64-v0.9.2-alpha.46.tar.gz"
      sha256 "55ddeceb61b327649b5071f5f9895d2b4dbe9af0b7d1cf3a5a939545a24fb4d7"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2-alpha.46/mato-linux-x86_64-v0.9.2-alpha.46.tar.gz"
      sha256 "513c99c3831f7994fd2954ebc725c68de4cbf157d3088fa515c5cda0af79400c"
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
