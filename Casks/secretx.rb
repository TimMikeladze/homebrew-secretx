cask "secretx" do
  version "0.1.0"
  sha256 "ac3b4bb37766eb52f1ac5f68561b79408503ac733c02a32bcc1aecaf71de3870"

  url "https://d7c7i2c00uccxa48.public.blob.vercel-storage.com/desktop/v#{version}/SecretX-#{version}-arm64.dmg"
  name "SecretX"
  desc "Secrets dashboard in the menu bar, for cloud and self-hosted servers"
  homepage "https://github.com/TimMikeladze/homebrew-secretx"

  # The in-app updater's manifest is the source of truth for the latest version
  livecheck do
    url "https://d7c7i2c00uccxa48.public.blob.vercel-storage.com/desktop/stable-macos-arm64-update.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # The app ships its own updater
  auto_updates true
  depends_on arch: :arm64
  # Electrobun's bundle declares LSMinimumSystemVersion 14
  depends_on macos: ">= :sonoma"

  app "SecretX.app"

  zap trash: [
    "~/Library/Application Support/dev.secretx.menubar",
    "~/Library/Caches/dev.secretx.menubar",
    "~/Library/LaunchAgents/dev.secretx.menubar.plist",
    "~/Library/WebKit/dev.secretx.menubar",
  ]
end
