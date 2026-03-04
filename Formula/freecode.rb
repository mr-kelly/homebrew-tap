class Freecode < Formula
  desc "Minimal autonomous coding agent — auto-selects best free model via OpenRouter"
  homepage "https://github.com/mr-kelly/freecode"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.12.0/freecode-macos-aarch64-v0.12.0.tar.gz"
      sha256 "22790544c9525f0edcb6c1081e0125698f27dfc1eebcb74323039d5a10649b33"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.12.0/freecode-macos-x86_64-v0.12.0.tar.gz"
      sha256 "5f485fcc6941db26539989dc973eed48f0cd17f45157702af746251a4b9ba929"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/freecode/releases/download/v0.12.0/freecode-linux-aarch64-v0.12.0.tar.gz"
      sha256 "6e8aae759a25ab466d00f8fa9a717a74046e107fa7dd4f18c6af8c911ec27562"
    else
      url "https://github.com/mr-kelly/freecode/releases/download/v0.12.0/freecode-linux-x86_64-v0.12.0.tar.gz"
      sha256 "af4b19eb1f04bbeb051c71d4d61851d0850848c99f87d368db8600414c1e4efc"
    end
  end

  def install
    bin.install "freecode"
  end

  test do
    assert_match "freecode", shell_output("#{bin}/freecode --version 2>&1", 1)
  end
end
