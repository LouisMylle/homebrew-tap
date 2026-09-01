cask "claudehub" do
  version "1.4.0"
  sha256 "d7bdc084d2e63fb3d9f5b4ba0837c1cd72d30b94427ebf8dde0e3b2c3e738388"

  url "https://github.com/LouisMylle/ClaudeHub/releases/download/v#{version}/ClaudeHub-#{version}.zip"
  name "ClaudeHub"
  desc "Browse and resume Claude Code sessions in embedded terminals"
  homepage "https://github.com/LouisMylle/ClaudeHub"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

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
