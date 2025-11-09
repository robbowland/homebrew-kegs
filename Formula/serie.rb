class Serie < Formula
  desc "Rich git commit graph in your terminal"
  homepage "https://github.com/robbowland/serie"
  url "https://github.com/robbowland/serie.git",
      branch: "master",
      revision: "e76ab9d4b3eb836daee276f78aac136dd6f1f002"
  version "0.5.3-rb3"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "serie 0.5.3", shell_output("#{bin}/serie --version")
  end
end
