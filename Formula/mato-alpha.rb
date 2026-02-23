class MatoAlpha < Formula
  desc "Multi-Agent Terminal Office (alpha)"
  homepage "https://github.com/mr-kelly/mato"
  version "0.9.0-alpha.42"
  license "MIT"
  conflicts_with "mato", because: "both install the same binary name: mato"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.42/mato-macos-aarch64-v0.9.0-alpha.42.tar.gz"
      sha256 "9c7f7afda3fdb790acb87d4790e3948e83afe772838c88ddb844df986d80ed00"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.42/mato-macos-x86_64-v0.9.0-alpha.42.tar.gz"
      sha256 "b0ce8415f89c61f1c0abd7a713f69579336d1796c69375d4908955ddbb658459"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.42/mato-linux-aarch64-v0.9.0-alpha.42.tar.gz"
      sha256 "eda77b4bb6268b53569a20f70fe26cc5fa91655964d6f07e03cac0d8d969f478"
    else
      url "https://github.com/mr-kelly/mato/releases/download/v0.9.0-alpha.42/mato-linux-x86_64-v0.9.0-alpha.42.tar.gz"
      sha256 "2c2e7079a1e0290058b049920393e0e6cde0348fa124b2da37a4e1447b26b39f"
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
