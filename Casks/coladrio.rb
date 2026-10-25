cask "coladrio" do
  version "0.9.9"
  sha256 "b43b8d54dd7507be51f110efdffbaca84838b1ad582cfaf4d5a0f3b7841bfe96"

  url "https://github.com/lakecam/homebrew-tap/releases/download/coladrio-v#{version}/Coladrio-#{version}.dmg"
  name "Coladrio"
  desc "Native Mac library for the photos, videos and files you already have"
  homepage "https://github.com/lakecam/homebrew-tap"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Coladrio.app"

  # The build is not notarised yet; let it open without the Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Coladrio.app"]
  end

  zap trash: [
    "~/Library/Application Support/Coladrio",
    "~/Library/Caches/Coladrio",
    "~/Library/Preferences/app.coladrio.Coladrio.plist",
  ]
end
