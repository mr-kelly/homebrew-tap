class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.5.0-alpha.10"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.10/mato-macos-aarch64-v0.5.0-alpha.10.tar.gz"
      sha256 "2ae4b84dd0ab8ee83d73ca8f5cbd0f6c252b2c97ffc5e779b218cb94a6cb7a45"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.10/mato-macos-x86_64-v0.5.0-alpha.10.tar.gz"
      sha256 "924e32c05486772f415359ec5bbf9f8f81917d974df337c32573c51e3946b7e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.10/mato-linux-aarch64-v0.5.0-alpha.10.tar.gz"
      sha256 "0af17752fde786edff4cb7dc4e88927a26dbe9c8969d7ae72ca60a3cb32cee5e"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.10/mato-linux-x86_64-v0.5.0-alpha.10.tar.gz"
      sha256 "067846e0dcf37ae46a14ef2c2a44ea62bc8f517cbb2467b68199bbb935e540d3"
    end
  end

  def install
    bin.install "mato"
  end

  test do
    assert_match "mato", shell_output("#{bin}/mato --version")
  end
end
