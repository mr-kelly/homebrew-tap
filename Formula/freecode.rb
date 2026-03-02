class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.11.0/freecode-macos-aarch64-v0.11.0.tar.gz"
      sha256 "613f78958b87dbc063b389f925fd6c4834b430b11a3743b88092e9ac85a02e7f"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.11.0/freecode-macos-x86_64-v0.11.0.tar.gz"
      sha256 "07945ec88ed4a4db5c3fdec5898a10c0e2561cc88ac9a72cf813ebb001f99659"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.11.0/freecode-linux-aarch64-v0.11.0.tar.gz"
      sha256 "1ea137747da2659f3e53f6652ee0ac620f76506e8ad293d46355cb6855c5ac96"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.11.0/freecode-linux-x86_64-v0.11.0.tar.gz"
      sha256 "bd695a2c46ca2a063e93eacd444a4fce6650640903d93b3a83b257a434508cb0"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
