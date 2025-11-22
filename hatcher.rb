class Hatcher < Formula
  desc "🥇 Git worktree management tool that hatches AI-powered development environments"
  homepage "https://github.com/keishimizu26629/hatcher"
  url "https://github.com/keishimizu26629/hatcher/archive/v1.0.0.tar.gz"
  sha256 "026a7375685f2902e6a08656af27e52abb0c34f1fe92a2db52e02b0a610984da"
  license "MIT"
  head "https://github.com/keishimizu26629/hatcher.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version} -X main.Commit=#{version} -X main.Date=#{Time.now.strftime("%Y-%m-%d_%H:%M:%S")}")
  end

  test do
    # Test basic functionality
    assert_match "Hatcher - Git Worktree Tool", shell_output("#{bin}/hatcher --help")
    
    # Test version
    assert_match version.to_s, shell_output("#{bin}/hatcher --version")
    
    # Test doctor command (should work outside git repo)
    output = shell_output("#{bin}/hatcher doctor 2>&1", 2)
    assert_match "Git Installation", output
  end
end
