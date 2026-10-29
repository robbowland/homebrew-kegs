class Weaver < Formula
  desc "Coding agents side by side in tmux: pick up whichever thread needs you"
  homepage "https://github.com/robbowland/weaver"
  url "https://github.com/robbowland/weaver.git",
      tag:      "v0.10.0",
      revision: "d28952c54d45af22760e9f575436f64d346250e8"
  license "MIT"
  head "https://github.com/robbowland/weaver.git", branch: "main"

  depends_on "go" => :build
  depends_on "fzf"
  depends_on "gh"
  depends_on "neovim"
  depends_on "tmux"
  depends_on "worktrunk"

  def install
    system "go", "build", *std_go_args(output: bin/"wvr", ldflags: "-s -w -X main.version=#{version}"), "./cmd/wvr"
  end

  def caveats
    <<~EOS
      Run `wvr` to start weaver's tmux session. It sets itself up as it
      starts: Claude Code's (and Codex's) hooks run it, and the Neovim
      plugin its reviews need is fetched. A view not signed in yet (GITHUB,
      LINEAR) shows how, and signs in on one key.
      `wvr doctor` says what is set up and what is left; `--fix` does it.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wvr version")
  end
end
