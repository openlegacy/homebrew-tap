class OpenlegacyCli < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/1.6.0/linux-macos/openlegacy-cli.zip"
  version "1.6.0"
  sha256 "f064c325af604b39341bf8e7e207e75263f9d500b6afad5389878ab3fceca401"

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
