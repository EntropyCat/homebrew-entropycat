class Entropycat < Formula
  desc "Real-time data quality agent for Kafka streams"
  homepage "https://entropycat.io"
  version "0.2.5"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_arm64.zip"
      sha256 "4640d116e7aa9e4c9d31230ee501a0fc9375043ed33d787798395354793544b5"
    end
    on_intel do
      url "https://github.com/EntropyCat/entropycat/releases/download/v#{version}/entropycat_#{version}_darwin_x86_64.zip"
      sha256 "478f05b0cdd5d2f4d4a2fe3da85a421c2b473fd44148fd9bbc318e0b8a6ef34b"
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
