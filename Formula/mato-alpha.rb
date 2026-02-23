class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.5-alpha.60"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.60/mato-macos-aarch64-v0.9.5-alpha.60.tar.gz"
      sha256 "96acfc69a53d869a77f6366f93c83156653de62fbd4703a6b864e238d6fc393c"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.60/mato-macos-x86_64-v0.9.5-alpha.60.tar.gz"
      sha256 "7f787a6916b9abf3b9769fb1d30dd7b6759ad60db2386c926efa125ae1c8e19a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.60/mato-linux-aarch64-v0.9.5-alpha.60.tar.gz"
      sha256 "b06ca1ac1295139ecc3010e6e45ac7c130b08f02775693ad9be9c1e0337854fa"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.5-alpha.60/mato-linux-x86_64-v0.9.5-alpha.60.tar.gz"
      sha256 "23fcdda3c885717203f89b0d1f550463e54bdf4f14f7b9f35748852c564cd374"
    end
  end

  def install
    bin.install "mato"
  end

  def caveats
    <<~EOS
      If you installed mato by another method (for example: install.sh to ~/.local/bin),
      your shell may still resolve that binary first.

      Check command priority with:
        which -a mato
    EOS
  end

  test do
    assert_match "mato", shell_output("#{bin}/mato --version")
  end
end
