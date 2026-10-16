class LinearTui < Formula
  desc "Linear in your terminal, built for coding agents too"
  homepage "https://github.com/k1-c/linear-tui"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/k1-c/linear-tui/releases/download/v0.13.1/linear-tui-aarch64-apple-darwin.tar.gz"
      sha256 "8bee925c82fc3b6f694ef57a7cf291a9322561690e50d5db4f64fc68d63da682"
    end
    on_intel do
      url "https://github.com/k1-c/linear-tui/releases/download/v0.13.1/linear-tui-x86_64-apple-darwin.tar.gz"
      sha256 "602d5bbada3059d1fdcd1c699172eb1da99a224a05fc1422ac30319ff14b8f4b"
    end
  end

  def install
    bin.install "linear-tui"
  end

  test do
    assert_match "linear-tui #{version}", shell_output("#{bin}/linear-tui --version")
  end
end
