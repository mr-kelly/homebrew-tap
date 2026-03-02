class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.11.1/freecode-macos-aarch64-v0.11.1.tar.gz"
      sha256 "f126d898177fa64d9f189c7b615830e19de5eac6e4a261924fbb764edc433c38"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.11.1/freecode-macos-x86_64-v0.11.1.tar.gz"
      sha256 "d81e61faa20da64edb21f5d4d91cd9670870956b0214d8c8a46ad3dde2327eca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.11.1/freecode-linux-aarch64-v0.11.1.tar.gz"
      sha256 "95b90f14f50eafbd25474c54ee5dd839e6bcc07f9c58b228e29bf2ae57e0e652"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.11.1/freecode-linux-x86_64-v0.11.1.tar.gz"
      sha256 "d2411bfc65ac180fa952ac4a0def60fc8355fe7eb5e592a0bfb02623b44dcb18"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
