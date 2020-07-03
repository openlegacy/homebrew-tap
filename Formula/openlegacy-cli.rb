class OpenlegacyCli < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/homebrew-openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/1.5.0/openlegacy-cli.zip"
  version "1.5.0"
  sha256 "b48a5553ab3b4d539439ed66e4a362adb86baf72b59a39c870517e379de98b3d"

  def install
    inreplace "ol/bin/ol", "##PREFIX##", "#{prefix}"
    prefix.install "ol/bin/cli.jar"
    bin.install "ol/bin/ol"
    bash_completion.install "ol/bin/.ol-completion.sh" => "ol"
    zsh_completion.install "ol/bin/.ol-completion.zsh" => "_ol"
  end

  test do
    system bin/"ol", "-v"
  end
end
