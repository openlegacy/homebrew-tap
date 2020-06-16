class OpenlegacyCli < Formula
    desc "Digitize Your Legacy With OpenLegacy's Hub"
    homepage "https://github.com/openlegacy/homebrew-openlegacy-cli"
    url "https://ol-public-artifacts.s3.amazonaws.com/cli/1.3.0/prod/387/openlegacy_cli_linux.tar.gz"
    version "1.3.0"
    sha256 "3d87fa997ae0ccf4000dcd2dd3c085a3d18fdb41cbb57110292aa1ee6936eec0"
  
    def install
      chmod 0755, "ol"
      inreplace "ol", "##PREFIX##", "#{prefix}"
      prefix.install "cli.jar"
      bin.install "ol"
      bash_completion.install ".ol-completion.sh" => "ol"
    end
  
    test do
      assert_match "-F _ol",
      shell_output("bash -c 'source #{bash_completion}/ol && complete -p ol'")
    end
  end
