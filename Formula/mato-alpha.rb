class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.6.0-alpha.20"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.6.0-alpha.20/mato-macos-aarch64-v0.6.0-alpha.20.tar.gz"
      sha256 "c2c63c9b9d996b990536f54646851dca00fd241188492a2721782232ad70a7d9"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.6.0-alpha.20/mato-macos-x86_64-v0.6.0-alpha.20.tar.gz"
      sha256 "f6fab0186b11626e401f0c1f7d602097a1348a39ac8acbf9137c4269aba839ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.6.0-alpha.20/mato-linux-aarch64-v0.6.0-alpha.20.tar.gz"
      sha256 "29881af31488a9df4bb26b81eb9137ebb935f1a9c79a8a3823e864848dcce9e9"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.6.0-alpha.20/mato-linux-x86_64-v0.6.0-alpha.20.tar.gz"
      sha256 "59014157837d504e2e821347132d7fb694c00f447e9f8f3c24b7644f52922bf3"
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
