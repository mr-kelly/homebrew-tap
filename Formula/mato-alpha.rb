class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.5.0-alpha.12"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.12/mato-macos-aarch64-v0.5.0-alpha.12.tar.gz"
      sha256 "868f3f8a6fbc37c419703f790247e44bccb89725af117d44ee122cd4e8e479cf"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.12/mato-macos-x86_64-v0.5.0-alpha.12.tar.gz"
      sha256 "ad8ebe1ce96256645db068cbda5f9d50a4d1c864fe2a5b7d6b15a7b0bf54e48e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.12/mato-linux-aarch64-v0.5.0-alpha.12.tar.gz"
      sha256 "a0ffc2e342dc633e3ffc344d4824b9ee88ee695c70ced315661fa5bce901e35e"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.5.0-alpha.12/mato-linux-x86_64-v0.5.0-alpha.12.tar.gz"
      sha256 "fc00218c22232a9ee32a561e26ff151342ca349d1971131d0d40885832613c60"
    end
  end

  def install
    bin.install "mato"
  end

  test do
    assert_match "mato", shell_output("#{bin}/mato --version")
  end
end
