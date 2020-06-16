class OpenlegacyCli < Formula
    desc "Digitize Your Legacy With OpenLegacy's Hub"
    homepage "https://github.com/openlegacy/homebrew-openlegacy-cli"
    url "https://ol-public-artifacts.s3.amazonaws.com/cli/1.3.0/prod/387/install_linux.zip"
    version "1.3.0"
    sha256 "fd3db716c701f3b27836f4224c0bba8703d559ddf4646af9fcadbf73ba80df2a"
  
    def install
      chmod 0755, "ol"
      inreplace "ol", "##PREFIX##", "#{prefix}"
      prefix.install "cli.jar"
      bin.install "ol"
      bash_completion.install "ol-completion.bash" => "ol"
    end
  
    test do
      assert_match "-F _ol",
      shell_output("bash -c 'source #{bash_completion}/ol && complete -p ol'")
    end
  end