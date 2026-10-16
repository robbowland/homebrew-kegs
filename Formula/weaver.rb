class Weaver < Formula
  desc "Coding agents side by side in tmux: pick up whichever thread needs you"
  homepage "https://github.com/robbowland/weaver"
  url "https://github.com/robbowland/weaver.git",
      tag:      "v0.2.0",
      revision: "5dec12792c7e50820e241006f96abe6b617e0055"
  license "MIT"

  depends_on "go" => :build
  depends_on "fzf"
  depends_on "gh"
  depends_on "neovim"
  depends_on "robbowland/kegs/gh-dash"
  depends_on "robbowland/kegs/linear-tui"
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
      `wvr doctor` says what is set up and what is left.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wvr version")
  end
end
