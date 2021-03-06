class XcframeworkNow < Formula
  desc "Utility for transforming a given library or framework into an XCFramework, generating the arm64 simulator slices if missing."
  homepage "https://github.com/gui17aume/xcframework-now"
  url "https://github.com/gui17aume/xcframework-now/archive/refs/tags/0.2.1.tar.gz"
  sha256 "f844b9b04470c11d5d92e42d50580b8c2c917156e6b1f656995f0a991acdf2c7"
  license "MIT"

  depends_on xcode: ["11.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    system "install", "-d", "#{prefix}/bin"
    system "install", ".build/release/xcframework-now", "#{prefix}/bin"
  end

  test do
    system "#{bin}/xcframework-now", "-help"
  end
end
