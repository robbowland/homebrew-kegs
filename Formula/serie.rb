class Serie < Formula
  desc "Rich git commit graph in your terminal"
  homepage "https://github.com/robbowland/serie"
  url "https://github.com/robbowland/serie.git",
      branch: "master",
      revision: "ceb3cf2eedbe3d0179fcf29ab5d83d4785c74554"
  version "0.5.3-rb4"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "serie 0.5.3", shell_output("#{bin}/serie --version")
  end
end
