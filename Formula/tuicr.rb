class Tuicr < Formula
  desc "Code review TUI with vim keybindings"
  homepage "https://github.com/robbowland/tuicr"
  url "https://github.com/robbowland/tuicr.git",
      branch:   "rb",
      revision: "0c4ec84998520bd2f8006b6a5061840e20ec4779"
  version "0.28.0-rb1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tuicr --version")
  end
end
