class Entropycat < Formula
  desc "Real-time data quality agent for Kafka streams"
  homepage "https://entropycat.io"
  version "0.3.2"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_arm64.zip"
      sha256 "170c6f42add072f616af07764d795b8b2f3b1d008b7f7492d6c8b74e03564365"
    end
    on_intel do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_x86_64.zip"
      sha256 "499311bf6135358d75c631ab8cdabb2c92bd0d5f27013bfd6567b1b9a6658fae"
    end
  end

  def install
    # standalone Nuitka build: a folder of the launcher + its dylibs/data.
    # Install the whole thing into libexec and symlink just the launcher onto PATH.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"entropycat"
  end

  def caveats
    <<~EOS
      Run `entropycat init` to complete setup. You will be prompted for your
      Kafka brokers and Slack bot token. 
    EOS
  end

  test do
    system "#{bin}/entropycat", "--help"
  end
end
