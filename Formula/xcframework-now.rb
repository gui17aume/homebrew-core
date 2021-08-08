class XcframeworkNow < Formula
  desc "Utility for transforming a given library or framework into an XCFramework, generating the arm64 simulator slices if missing."
  homepage "https://github.com/gui17aume/xcframework-now"
  url "https://github.com/gui17aume/xcframework-now/archive/refs/tags/0.2.0.tar.gz"
  sha256 "d55747a30c8221b2f4c4be535b3e6037ad403ccaa45176c5f144bdbd132e24b1"
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
