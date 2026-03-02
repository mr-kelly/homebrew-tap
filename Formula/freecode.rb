class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.0/freecode-macos-aarch64-v0.9.0.tar.gz"
      sha256 "776de6208828ce6cb824e36c02047a38854925674f30bbc48f6547936e0bb27f"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.0/freecode-macos-x86_64-v0.9.0.tar.gz"
      sha256 "e4d0eb494d3c1d1cf6ba120cecd2d1a03da8e6974097e6901aff14f0a21cfced"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.0/freecode-linux-aarch64-v0.9.0.tar.gz"
      sha256 "b08b8117aed4c518a1116b1d3cca435237ea30a98dcead65d1b5babac56037ac"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.9.0/freecode-linux-x86_64-v0.9.0.tar.gz"
      sha256 "3727c4232c614ae93b6b0c32d3ab92b6e941cc212599c83f6160a9f44c1bac97"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
