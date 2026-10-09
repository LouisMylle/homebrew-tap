cask "claudehub" do
  version "1.6.3"
  sha256 "f30eea636f8125dc21d8fcbbe9aec34b7f02800645c6baa84a568cf5f2061254"

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
