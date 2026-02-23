class Mato < Formula
  desc "Multi-Agent Terminal Office"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.2"
  license "MIT"
  conflicts_with "mato-alpha", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2/mato-macos-aarch64-v0.9.2.tar.gz"
      sha256 "d20e41711397887ab9f706659bd079e7a7f9466bf6d03bd98b7345b2d9d865ae"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2/mato-macos-x86_64-v0.9.2.tar.gz"
      sha256 "fb7b00c9ed87c99e12e7a8f28b39dd1effa8108d63806a3cf50960b434bd9103"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2/mato-linux-aarch64-v0.9.2.tar.gz"
      sha256 "a8da57f62db6504804ee7a904bb01c00082ce1c8fd97626e620fb32c0247c0a6"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.2/mato-linux-x86_64-v0.9.2.tar.gz"
      sha256 "ac80cd26aea843f210ac0f7a25e4ce825e935962a60d849e9634db7e3bdda278"
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
