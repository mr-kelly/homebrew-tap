class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.4.0-alpha.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.4/mato-macos-aarch64-v0.4.0-alpha.4.tar.gz"
      sha256 "45347039e1731c447180d71a51953ad7d6304f3b829757255a874ac038e58a40"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.4/mato-macos-x86_64-v0.4.0-alpha.4.tar.gz"
      sha256 "99a53b9a55b3928acb1ae0d84dad73823cb6b8ce0fd67a9bbc2bdde257d133cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.4/mato-linux-aarch64-v0.4.0-alpha.4.tar.gz"
      sha256 "d5e3d39f07590fc6bfb92d0ba3376721d43ccd8b46e746c331a41ad130144865"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.4/mato-linux-x86_64-v0.4.0-alpha.4.tar.gz"
      sha256 "9e34f579ab689709b4f0775da1d92b0092657ed9d6a97b33a84577a6fb65a93c"
    end
  end

  def install
    bin.install "mato"
  end

  test do
    assert_match "mato", shell_output("#{bin}/mato --version")
  end
end
