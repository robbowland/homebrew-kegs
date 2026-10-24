class Svim < Formula
  desc "Turns macOS input fields into real vim buffers"
  homepage "https://github.com/robbowland/SketchyVim"
  url "https://github.com/robbowland/SketchyVim.git",
      branch:   "master",
      revision: "a5201e7b8a2be69f62a21618adfb913707bfe763"
  version "1.0.11-rb1"
  license "GPL-3.0-only"

  depends_on :macos

  def install
    system "make"
    bin.install "bin/svim"
    (pkgshare/"examples").install "examples/svimrc", "examples/blacklist", "examples/svim.sh"
  end

  def caveats
    <<~EOS
      Copy the example configuration into your home directory and make the script executable:
        mkdir ~/.config/svim
        cp #{opt_pkgshare}/examples/* ~/.config/svim/
        chmod +x ~/.config/svim/svim.sh

      Each new build has a new code signature, so after an install or upgrade
      grant svim Accessibility again (System Settings > Privacy & Security).
    EOS
  end

  service do
    run opt_bin/"svim"
    environment_variables PATH: std_service_path_env
    keep_alive true
    process_type :interactive
  end

  test do
    assert_predicate bin/"svim", :executable?
  end
end
