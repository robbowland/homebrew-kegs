class Tuicr < Formula
  desc "Code review TUI with vim keybindings"
  homepage "https://github.com/robbowland/tuicr"
  url "https://github.com/robbowland/tuicr.git",
      branch:   "rb",
      revision: "961df118fffe21d7cd429d5e50bc456e2c76ea32"
  version "0.28.0-rb2"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tuicr --version")
  end
end
