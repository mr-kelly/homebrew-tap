class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.5.0-alpha.8"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.8/mato-macos-aarch64-v0.5.0-alpha.8.tar.gz"
      sha256 "46a137a020e63af3e6449fb03e1dbfbef4a60d6bfb4e558d04c536b5a63ac47e"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.8/mato-macos-x86_64-v0.5.0-alpha.8.tar.gz"
      sha256 "0a70be242a60306858f59958b8209378285fcda8cd25bd6dbaf7c659d2a2cad4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.8/mato-linux-aarch64-v0.5.0-alpha.8.tar.gz"
      sha256 "93d2f816856e73fa31f811db30ae01222720cd755ae28e17081f20c7460edfc3"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.8/mato-linux-x86_64-v0.5.0-alpha.8.tar.gz"
      sha256 "f673fc857131cf6f10397331d5a57c8cbe822e444d5c3419a25e94fcf895c546"
    end
  end

  def install
    bin.install "mato"
  end

  test do
    assert_match "mato", shell_output("#{bin}/mato --version")
  end
end
