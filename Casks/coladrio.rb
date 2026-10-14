cask "coladrio" do
  version "0.8.1"
  sha256 "0d93002078b0d381c8427193ddfb97294802026ab091a8cfd5c368776501bac5"

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
