class OpenlegacyCliAlpha < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/alpha/linux-macos/openlegacy-cli.zip"
  version "alpha"
  sha256 "08bbf61f9aec17b0d552e3fa1d2977de1d3d006f16d9c8199a0737d08dca3c32"

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

    puts green('************************************************************************************************')
    puts 'Note that the CLI require java 17 or higher, please make sure its installed and JAVA_HOME is configured'
    puts green('************************************************************************************************')
  end

  test do
    system bin/"ol", "-v"
  end
end
