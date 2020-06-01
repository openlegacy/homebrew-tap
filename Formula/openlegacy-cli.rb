class OpenlegacyCli < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/1.5.0/openlegacy-cli.zip"
  version "1.5.0"
  sha256 "f7f2f745d4632be31b39381d1301e8fc17464506ec29388f5ba877941c77786c"

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
