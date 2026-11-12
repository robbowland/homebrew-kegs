class Weaver < Formula
  desc "Coding agents side by side in Rex: pick up whichever thread needs you"
  homepage "https://github.com/robbowland/weaver"
  url "https://github.com/robbowland/weaver.git",
      tag:      "v0.13.2",
      revision: "8f677d7edb3ae392f78cdb50213d376252448033"
  license "MIT"
  head "https://github.com/robbowland/weaver.git", branch: "main"

  depends_on "go" => :build
  depends_on "fzf"
  depends_on "gh"
  depends_on "neovim"
  depends_on "robbowland/kegs/tuicr"
  depends_on "worktrunk"

  def install
    system "go", "build", *std_go_args(output: bin/"wvr", ldflags: "-s -w -X main.version=#{version}"), "./cmd/wvr"
  end

  def caveats
    <<~EOS
      Run `wvr` in Rex to start weaver. It sets itself up as it starts:
      Claude Code's hooks run it, and it installs its workflow skill for
      Claude Code and a theme for tuicr, its review panel. A view not signed
      in yet (GITHUB, LINEAR) shows how, and signs in on one key.
      `wvr doctor` says what is set up and what is left; `--fix` does it.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wvr version")
  end
end
