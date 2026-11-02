cask "xattot" do
  version "0.3.0"
  sha256 "e12e13273b56e525080ac98e129c87aba4debc0c5509f951074add3ce51ae0c9"

  url "https://github.com/sanjarbarakayev/xattot/releases/download/v#{version}/Xattot.dmg"
  name "Xattot"
  desc "Input method and keyboard layout for the new Uzbek Latin alphabet"
  homepage "https://github.com/sanjarbarakayev/xattot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Xattot.app"

  uninstall quit: "com.sanjarbarakayev.xattot"

  # The app copies the input method and the layout into ~/Library on launch.
  zap quit:  "com.sanjarbarakayev.inputmethod.xattot",
      trash: [
        "~/Library/Input Methods/XattotInputMethod.app",
        "~/Library/Keyboard Layouts/Xattot.bundle",
        "~/Library/Preferences/com.sanjarbarakayev.inputmethod.xattot.plist",
        "~/Library/Preferences/com.sanjarbarakayev.xattot.plist",
      ]

  caveats <<~EOS
    Xattot is not signed with an Apple Developer ID, so macOS blocks its first launch.
    Open it once from Applications, then allow it in
      System Settings > Privacy & Security > Open Anyway

    `brew uninstall --cask --zap xattot` also removes the input method and the layout
    the app installed into ~/Library. Remove them from
      System Settings > Keyboard > Input Sources
    first.
  EOS
end
