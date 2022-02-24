class OpenlegacyCliAlpha < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/alpha/linux-macos/openlegacy-cli.zip"
  version "alpha"
  sha256 "17711d19443e93017ecaa0fd17f2cb9841982696c9f5d1e58cbf3549bfab7ef8"

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def green(text); colorize(text, 32); end

  def install
    inreplace "bin/ol", "##PREFIX##", "#{prefix}"
    prefix.install "bin/cli.jar"
    bin.install "bin/ol"
    bash_completion.install "bin/.ol-completion.sh" => "ol"
    zsh_completion.install "bin/.ol-completion.zsh" => "_ol"

    puts green('*********************************************************************************************')
    puts 'Note that the CLI require java 11, please make sure its installed and JAVA_HOME is configured'
    puts green('*********************************************************************************************')
  end

  test do
    system bin/"ol", "-v"
  end
end
