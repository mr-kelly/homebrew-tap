class Mato < Formula
  desc "Multi-Agent Terminal Office"
  homepage "https://github.com/mr-kelly/mato"
  license "MIT"
  conflicts_with "mato-alpha", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.2/mato-macos-aarch64-v0.4.0-alpha.2.tar.gz"
      sha256 "21e0ae4f3f39b93dceae9fd0a8017b8d1a0da2782d19bbb94f0ce732d326abe5"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.2/mato-macos-x86_64-v0.4.0-alpha.2.tar.gz"
      sha256 "1c22984ad697ab591e157e8719ba33697891873c3b3db1787bd0b407890486d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.2/mato-linux-aarch64-v0.4.0-alpha.2.tar.gz"
      sha256 "8a6be83782ec12701f4100ccf86303dd1ce4bb2af959c4898a90265db903bda0"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.4.0-alpha.2/mato-linux-x86_64-v0.4.0-alpha.2.tar.gz"
      sha256 "4a8270f6a04cfd7acaafd227bc44793373b1cf68acafdf298889835f4c9374e8"
    end
  end

  def install
    bin.install "mato"
  end

  test do
    assert_match "mato", shell_output("#{bin}/mato --version")
  end
end
