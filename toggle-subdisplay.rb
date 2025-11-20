class ToggleSubdisplay < Formula
  desc "CLI to toggle Mac subdisplay settings between mirror and extended modes"
  homepage "https://github.com/keishimizu26629/toggle-subdisplay"
  url "https://github.com/keishimizu26629/toggle-subdisplay/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ff06baa9a0bfb036294ee698e5c67032a2d79b4c48878f54b7137c29f0cab587"
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
