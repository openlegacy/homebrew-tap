class OpenlegacyCli < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/2.8.0/linux-macos/openlegacy-cli.zip"
  version "2.8.0"
  sha256 "24ef54ceb2fed6428db035e4a59a5266a4fd1d34baefdab782954c31c4238cb4"

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
    puts 'Note that the CLI require java 11 or higher, please make sure its installed and JAVA_HOME is configured'
    puts green('************************************************************************************************')
  end

  test do
    system bin/"ol", "-v"
  end
end
