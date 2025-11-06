require "time"

class GhDash < Formula
  desc "GitHub CLI dashboard extension"
  homepage "https://github.com/robbowland/gh-dash"
  url "https://github.com/robbowland/gh-dash.git",
      branch: "main",
      revision: "53c8bc3adab3bd527f581609b17fe5d287f2f92b"
  version "4.0.0-rb1"
  license "MIT"

  depends_on "go" => :build

  def install
    short_commit = revision[0, 7]
    ldflags = %W[
      -s -w
      -X github.com/dlvhdr/gh-dash/v4/cmd.Version=#{version}
      -X github.com/dlvhdr/gh-dash/v4/cmd.Commit=#{short_commit}
      -X github.com/dlvhdr/gh-dash/v4/cmd.Date=#{Time.now.utc.iso8601}
      -X github.com/dlvhdr/gh-dash/v4/cmd.BuiltBy=homebrew
    ].join(" ")

    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version, shell_output("#{bin}/gh-dash --version")
  end
end
