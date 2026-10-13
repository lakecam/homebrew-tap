cask "coladrio" do
  version "0.3.0"
  sha256 "005bf19c763b9cd4b87c2f77e3d512959e2ef1d08aad54f51695fda05c8e7dea"

  url "https://github.com/lakecam/homebrew-tap/releases/download/coladrio-v#{version}/Coladrio-#{version}.dmg"
  name "Coladrio"
  desc "Native Mac library for the photos, videos and files you already have"
  homepage "https://github.com/lakecam/homebrew-tap"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Coladrio.app"

  # The build is not notarised yet; let it open without the Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Coladrio.app"]
  end

  zap trash: [
    "~/Library/Application Support/Coladrio",
    "~/Library/Caches/Coladrio",
    "~/Library/Preferences/app.coladrio.Coladrio.plist",
  ]
end
