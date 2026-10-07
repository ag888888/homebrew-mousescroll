cask "mousescroll" do
  version "1.0"
  sha256 "ae6d1d5aff1fdf4bec585eeb574480a2e65c5abce47213f54b2be7f0e63d3739"

  url "https://github.com/ag888888/mousescroll/releases/download/v#{version}/MouseScroll.zip"
  name "MouseScroll"
  desc "Menu bar app that reverses mouse wheel scrolling independently of the trackpad"
  homepage "https://github.com/ag888888/mousescroll"

  depends_on macos: :ventura

  app "MouseScroll.app"

  # The app is not notarized; remove the quarantine flag so it opens without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MouseScroll.app"]
  end

  zap trash: "~/Library/Preferences/com.ag.mousescroll.plist"
end
