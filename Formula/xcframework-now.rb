class XcframeworkNow < Formula
  desc "Utility for transforming a given library or framework into an XCFramework, generating the arm64 simulator slices if missing."
  homepage "https://github.com/gui17aume/xcframework-now"
  url "https://github.com/gui17aume/xcframework-now/archive/refs/tags/0.1.0.tar.gz"
  sha256 "db3bcd0c520a63ecc5e0d7a57e847bfd9e96691cdb7a32150b6a1a87096d2d64"
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
