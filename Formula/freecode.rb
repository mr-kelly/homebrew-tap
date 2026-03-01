class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.4.1/freecode-macos-aarch64-v0.4.1.tar.gz"
      sha256 "e55fa20cf35c247d07303cbfe35140af00bb739b8cada8a05cff8e719eca9889"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.4.1/freecode-macos-x86_64-v0.4.1.tar.gz"
      sha256 "159098e0039e67b98c9c5e2361420ae4770b3e95381cb536b33b245d3f66f606"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.4.1/freecode-linux-aarch64-v0.4.1.tar.gz"
      sha256 "d339b14f6d6662e887f98b037957c9cf1f8715a9d8e2557ff22461d5ec7156a6"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.4.1/freecode-linux-x86_64-v0.4.1.tar.gz"
      sha256 "e5f320eb28a169bec7d2151d6783d3c81080b78602b287ab06dd2dda038834a9"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
