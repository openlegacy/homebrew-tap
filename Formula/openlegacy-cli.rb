class OpenlegacyCli < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/1.50.0/linux-macos/openlegacy-cli.zip"
  version "1.50.0"
  sha256 "c24385aa29c6ddb82996b39a920453c3914d87b352e5f19dc7e6f0f973b81cff"

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
    puts 'Note that the CLI require java 11 or higher, please make sure its installed and JAVA_HOME is configured'
    puts green('*********************************************************************************************')
  end

  test do
    system bin/"ol", "-v"
  end
end
