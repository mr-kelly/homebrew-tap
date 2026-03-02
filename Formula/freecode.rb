class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.2/freecode-macos-aarch64-v0.9.2.tar.gz"
      sha256 "bd3b4500b32886a6363c63857e277c7e34ce05172e736e3f333154acaaccf93b"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.2/freecode-macos-x86_64-v0.9.2.tar.gz"
      sha256 "213106039df28bd4e0a81ccdb4e53f2ea47a6f60f9057d71c45ffd2087d370d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.2/freecode-linux-aarch64-v0.9.2.tar.gz"
      sha256 "e475760d4c16acb4ba744d4ae18bfc1fec50d830d0b740ef0ee0c8a05bd3baaf"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.2/freecode-linux-x86_64-v0.9.2.tar.gz"
      sha256 "a7b519d7dd860f8f40f42a381de8f90c5e01bb2b7ff2f2c7fb243c42215a0365"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
