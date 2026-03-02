class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.10.0/freecode-macos-aarch64-v0.10.0.tar.gz"
      sha256 "3c702ae914067c9b99e95649fbf2b311de8bbdb1fac015d18decad2bc876ca06"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.10.0/freecode-macos-x86_64-v0.10.0.tar.gz"
      sha256 "9a4da41b0a6e21f578c193d520f6e1cb0c937983db7b2f57302ffab342ea0fa7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.10.0/freecode-linux-aarch64-v0.10.0.tar.gz"
      sha256 "ac7421d9feceb85c3884dbcc9b4485ea32424a02e574a3c8b7a9daee927f52dd"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.10.0/freecode-linux-x86_64-v0.10.0.tar.gz"
      sha256 "870e31a4e8b724a327c4ec1c95aad9daa6e0208c5131a38b1f33af1fc1871f60"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
