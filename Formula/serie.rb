class Serie < Formula
  desc "Rich git commit graph in your terminal"
  homepage "https://github.com/robbowland/serie"
  url "https://github.com/robbowland/serie.git",
      branch: "master",
      revision: "7a6df4f01b60338ebba00b0a96688871674f67a8"
  version "0.5.3-rb4.0.1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "serie 0.5.3", shell_output("#{bin}/serie --version")
  end
end
