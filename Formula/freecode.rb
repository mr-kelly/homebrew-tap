class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.12.1/freecode-macos-aarch64-v0.12.1.tar.gz"
      sha256 "7053dcc3d02bf691cd579f4f5031a7eb240f9cfbc693f77962a93f1101a39543"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.12.1/freecode-macos-x86_64-v0.12.1.tar.gz"
      sha256 "4aaa029040eb75f96178218dc3231506e0a6c8d7a553cbe5a8341994e6771bb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.12.1/freecode-linux-aarch64-v0.12.1.tar.gz"
      sha256 "12e6f260b5fa64aad446eee437196af4e2fc1af9d7fdfc4579b40836ef88703b"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.12.1/freecode-linux-x86_64-v0.12.1.tar.gz"
      sha256 "6606fed758d3f41804f8f6d56d856e7bf1bbb51bb0060226c91bae24ff28f979"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
