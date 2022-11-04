class OpenlegacyCliAlpha < Formula
  desc "Digitize Your Legacy With OpenLegacy's Hub"
  homepage "https://github.com/openlegacy/openlegacy-cli"
  url "https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/alpha/linux-macos/openlegacy-cli.zip"
  version "alpha"
  sha256 "8fad64ecc0cac1cd7272e85d325b3d6c931fe11f77c9c16467db2c5d624aad5f"

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
