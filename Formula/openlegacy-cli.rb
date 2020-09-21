class OpenlegacyCli < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/1.10.0/linux-macos/openlegacy-cli.zip"
  version "1.10.0"
  sha256 "b5c63e316377c0a917294eb56002685a9dcb002f89a0e8e3b21c724ebc913e77"

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
