class Serie < Formula
  desc "Rich git commit graph in your terminal"
  homepage "https://github.com/robbowland/serie"
  url "https://github.com/robbowland/serie.git",
      branch: "master",
      revision: "f3ed1d73c5c7dc2892c0f82d08f8dc245130bef2"
  version "0.5.3-rb2"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "serie 0.5.3", shell_output("#{bin}/serie --version")
  end
end
