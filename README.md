# LouisMylle/homebrew-tap

Homebrew casks for [ClaudeHub](https://github.com/LouisMylle/ClaudeHub).

```sh
brew install --cask --no-quarantine LouisMylle/tap/claudehub
```

(`--no-quarantine` because the app is ad-hoc signed; without it, run
`xattr -dr com.apple.quarantine /Applications/ClaudeHub.app` once.)

Upgrade with `brew upgrade --cask claudehub`.
