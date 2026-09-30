cask "claudehub" do
  version "1.6.1"
  sha256 "2c5c3dd59e73f8ef017974967ae1e58eb2eb7b98de1eabdc6c916bd9474c8d9f"

  url "https://github.com/glm-labs/ClaudeHub/releases/download/v#{version}/ClaudeHub-#{version}.zip"
  name "ClaudeHub"
  desc "Browse and resume Claude Code sessions in embedded terminals"
  homepage "https://github.com/glm-labs/ClaudeHub"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "ClaudeHub.app"

  zap trash: [
    "~/Library/Application Support/ClaudeHub",
    "~/Library/Caches/ClaudeHub",
    "~/Library/Logs/ClaudeHub",
    "~/Library/Preferences/be.optimize.claudehub.plist",
  ]

  caveats <<~EOS
    ClaudeHub is ad-hoc signed (not notarized), so macOS quarantines it on
    first launch. Either install without quarantine:

      brew install --cask --no-quarantine LouisMylle/tap/claudehub

    or clear it once after installing:

      xattr -dr com.apple.quarantine "/Applications/ClaudeHub.app"

    ClaudeHub needs the Claude Code CLI: https://claude.com/claude-code
  EOS
end
