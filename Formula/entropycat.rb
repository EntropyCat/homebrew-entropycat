class Entropycat < Formula
  desc "Real-time data quality agent for Kafka streams"
  homepage "https://entropycat.io"
  version "0.2.8"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_arm64.zip"
      sha256 "98b5dc664f2206569a6fa642e7ac8e9ccd1e39e8551079f78832543980dfc3c9"
    end
    on_intel do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_x86_64.zip"
      sha256 "f0f5c3b7309d57238f8c585e88f96616ae76950d621a8202f55409871fc6cf8a"
    end
  end

  def install
    bin.install "entropycat"
    bin.install "entropycatd"
    (share/"entropycat").install "THIRD_PARTY_LICENSES.txt"
  end

  def caveats
    <<~EOS
      Run `entropycat` to complete setup. You will be prompted for your
      Kafka brokers and Slack bot token. 
    EOS
  end

  test do
    system "#{bin}/entropycat", "--help"
  end
end
