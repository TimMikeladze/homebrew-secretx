cask "secretx" do
  version "0.1.1"
  sha256 "11d01adfd644418007acd2199647a01807fe66852b6c88b8c95b24279e2057c7"

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
  depends_on macos: :sonoma

  app "SecretX.app"

  zap trash: [
    "~/Library/Application Support/dev.secretx.menubar",
    "~/Library/Caches/dev.secretx.menubar",
    "~/Library/LaunchAgents/dev.secretx.menubar.plist",
    "~/Library/WebKit/dev.secretx.menubar",
  ]
end
