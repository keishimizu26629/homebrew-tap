class Hatcher < Formula
  desc "🥇 Git worktree management tool that hatches AI-powered development environments"
  homepage "https://github.com/keishimizu26629/hatcher"
  url "https://github.com/keishimizu26629/hatcher/archive/v1.2.9.tar.gz"
  sha256 "c08967985c799779b4fe58b2ad9ca41d17e43fba12cd2699c3601d6a912a6ce9"
  license "MIT"
  head "https://github.com/keishimizu26629/hatcher.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version} -X main.Commit=#{version} -X main.Date=#{Time.now.strftime("%Y-%m-%d_%H:%M:%S")}")

    # Create hch alias for shorter command
    bin.install_symlink "hatcher" => "hch"
  end

  test do
    # Test basic functionality
    assert_match "Hatcher - Git Worktree Tool", shell_output("#{bin}/hatcher --help")

    # Test version
    assert_match version.to_s, shell_output("#{bin}/hatcher --version")

    # Test hch alias
    assert_match "Hatcher - Git Worktree Tool", shell_output("#{bin}/hch --help")
    assert_match version.to_s, shell_output("#{bin}/hch --version")

    # Test doctor command (should work outside git repo)
    output = shell_output("#{bin}/hatcher doctor 2>&1", 2)
    assert_match "Git Installation", output
  end
end
