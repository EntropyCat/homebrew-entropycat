class Entropycat < Formula
  desc "Real-time data quality agent for Kafka streams"
  homepage "https://entropycat.io"
  version "0.2.11"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_arm64.zip"
      sha256 "6250ecd6a193ec440ed0d3ffc8fdc5ef81a34372fe8b22d8316f2218eb19dbf4"
    end
    on_intel do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_x86_64.zip"
      sha256 "d6268d5b252dfdfef0d0d0624dbf9d8ea5efb18cc9df8ea7f5c25a7cff5a511c"
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
