class Entropycat < Formula
  desc "Real-time data quality agent for Kafka streams"
  homepage "https://entropycat.io"
  version "0.2.12"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_arm64.zip"
      sha256 "1fec4b48e81b17a6dbf9c621b5f52946006efd08b3ba4b9d3629f55568f1faa5"
    end
    on_intel do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_x86_64.zip"
      sha256 "37f1980e1957e0dc25a49a08e93e344039619f463dff9140c3bd3190df558ded"
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
