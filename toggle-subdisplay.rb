class ToggleSubdisplay < Formula
  desc "CLI to toggle Mac subdisplay settings between mirror and extended modes"
  homepage "https://github.com/keishimizu26629/toggle-subdisplay"
  url "https://github.com/keishimizu26629/toggle-subdisplay/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_THIS_WITH_SHA"
  license "MIT"

  depends_on xcode: ["12.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/toggle-subdisplay"
  end

  test do
    # Test that the binary runs and shows help/version info
    system "#{bin}/toggle-subdisplay", "--query"
  end
end
