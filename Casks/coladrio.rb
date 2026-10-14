cask "coladrio" do
  version "0.7.1"
  sha256 "b504391d08e79195cd542a595dee06cc56bf4a9db91ae64767e0b02642274f2b"

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
