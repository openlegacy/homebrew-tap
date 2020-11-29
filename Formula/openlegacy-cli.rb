class OpenlegacyCli < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/1.15.0/linux-macos/openlegacy-cli.zip"
  version "1.15.0"
  sha256 "a160dc9d4b93c8cc2813e5cae80d9ca347c3e047b8ba7a718f9997cd16bacfea"

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
