class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.4.0-alpha.7"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.7/mato-macos-aarch64-v0.4.0-alpha.7.tar.gz"
      sha256 "ecc4d934177159ae64d53ecf10327fbbc5750a920b2b3eaa4b07d9782efc928c"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.7/mato-macos-x86_64-v0.4.0-alpha.7.tar.gz"
      sha256 "d12fe79c4a5d1b5568fe0bd79dad1853e1a9b5e75fb7b52806c94f654c710b05"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.7/mato-linux-aarch64-v0.4.0-alpha.7.tar.gz"
      sha256 "6c9800b79e20a82b15dc85a8b84c755da3aa62de50c8006af7624a1ae8a14e92"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.7/mato-linux-x86_64-v0.4.0-alpha.7.tar.gz"
      sha256 "86e6eecf2e82e872f8d914ddbe43b5b7b4eed88255d218de2163ffc2f4199fc3"
    end
  end

  def install
    bin.install "mato"
  end

  test do
    assert_match "mato", shell_output("#{bin}/mato --version")
  end
end
