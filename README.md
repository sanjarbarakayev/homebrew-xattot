# Homebrew tap for Xattot

[Xattot](https://github.com/sanjarbarakayev/xattot) types the new Uzbek Latin alphabet on a Mac.

```bash
brew tap sanjarbarakayev/xattot
brew trust --cask sanjarbarakayev/xattot/xattot
brew install --cask sanjarbarakayev/xattot/xattot
```

Homebrew loads casks from a tap outside its own organisation only once you trust them, hence
the second line. Update with `brew upgrade --cask xattot`.

The app itself never reaches the network: Homebrew downloads the release DMG from GitHub and
checks its SHA-256. The DMG carries a build provenance attestation you can check with
`gh attestation verify Xattot.dmg --repo sanjarbarakayev/xattot`.

The app is not signed with an Apple Developer ID, so macOS blocks its first launch: open it once,
then allow it in System Settings > Privacy & Security > Open Anyway.

`brew uninstall --cask --zap xattot` also removes the input method and the layout the app
installed into `~/Library`; remove them from System Settings > Keyboard > Input Sources first.
