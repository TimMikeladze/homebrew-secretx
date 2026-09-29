cask "secretx" do
  version "0.1.0"
  sha256 "ac3b4bb37766eb52f1ac5f68561b79408503ac733c02a32bcc1aecaf71de3870"

  url "https://d7c7i2c00uccxa48.public.blob.vercel-storage.com/desktop/v#{version}/SecretX-#{version}-arm64.dmg"
  name "SecretX"
  desc "Secrets dashboard in the menu bar, for cloud and self-hosted servers"
  homepage "https://github.com/TimMikeladze/homebrew-secretx"

  depends_on arch: :arm64
  depends_on macos: :big_sur
  # The app ships its own updater
  auto_updates true

  app "SecretX.app"

  zap trash: [
    "~/Library/Application Support/dev.secretx.menubar",
    "~/Library/Caches/dev.secretx.menubar",
    "~/Library/LaunchAgents/dev.secretx.menubar.plist",
    "~/Library/WebKit/dev.secretx.menubar",
  ]
end
