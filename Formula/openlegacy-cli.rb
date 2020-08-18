class OpenlegacyCli < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/1.7.0/linux-macos/openlegacy-cli.zip"
  version "1.7.0"
  sha256 "65b3eaffab003aaeeb04495a8132f17e5b7484eadc57ecea97c9e8808f727e9b"

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
