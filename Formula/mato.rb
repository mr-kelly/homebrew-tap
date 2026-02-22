class Mato < Formula
  desc "Multi-Agent Terminal Office"
  homepage "https://github.com/mr-kelly/mato"
  version "0.5.0"
  license "MIT"
  conflicts_with "mato-alpha", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0/mato-macos-aarch64-v0.5.0.tar.gz"
      sha256 "5cccfdbcc591bc221a602ec2c7ef63931f3697f4f421cca28e91cc724a868278"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0/mato-macos-x86_64-v0.5.0.tar.gz"
      sha256 "723c5b6398098c428ae4320662d303438bed8185f173d457f720a88cd907cc33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0/mato-linux-aarch64-v0.5.0.tar.gz"
      sha256 "02d1a43ed3cb9e83cd87f76fca21cce7dbec19ff93f72d6adc41cac478d13cc8"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0/mato-linux-x86_64-v0.5.0.tar.gz"
      sha256 "78ac4e4c8d0cab9b7aaaaff03494902a7381d42119ffc27d7d7cb4ef8034f3c5"
    end
  end

  def install
    bin.install "mato"
  end

  test do
    assert_match "mato", shell_output("#{bin}/mato --version")
  end
end
