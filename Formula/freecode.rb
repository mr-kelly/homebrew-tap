class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.8.0/freecode-macos-aarch64-v0.8.0.tar.gz"
      sha256 "9e5577491590942ad58a19b7a7aadd256d82b3842ea016ebc837745c8112506a"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.8.0/freecode-macos-x86_64-v0.8.0.tar.gz"
      sha256 "662c1599b1fe15eb78cc78c72ed2ee59ae61f244ddb93feb7caff96dbe4a56d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.8.0/freecode-linux-aarch64-v0.8.0.tar.gz"
      sha256 "5af78671e22e04df7506d1594a5b7e03e33710d409272164dcf36d91ee2f69b0"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.8.0/freecode-linux-x86_64-v0.8.0.tar.gz"
      sha256 "7063d35150c79c4089dbd74c5831c819b9bf4634886f35cba6e87a88d9ab0976"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
