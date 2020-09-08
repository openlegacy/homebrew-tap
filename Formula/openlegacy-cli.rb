class OpenlegacyCli < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/1.9.0/linux-macos/openlegacy-cli.zip"
  version "1.9.0"
  sha256 "e3a17ab922ceb38ceaf491cac50bb40d71d9ee48cefadef223d010b4be7de9ab"

  def install
    inreplace "bin/ol", "##PREFIX##", "#{prefix}"
    prefix.install "bin/cli.jar"
    bin.install "bin/ol"
    bash_completion.install "bin/.ol-completion.sh" => "ol"
    zsh_completion.install "bin/.ol-completion.zsh" => "_ol"
  end

  test do
    system bin/"ol", "-v"
  end
end
