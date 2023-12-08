cask "polymc" do
  version "5.1"
  sha256 "17ccf99a971a35f6d521eb36afc7013bc5186ca0a96ce391e8e2ae0e01de47e7"

  url "https://github.com/PolyMC/PolyMC/releases/download/#{version}/PolyMC-macOS-#{version}.tar.gz",
      verified: "github.com/PolyMC/PolyMC/"
  name "PolyMC"
  desc "Custom launcher for Minecraft that allows you to easily manage multiple installations of Minecraft at once (Fork of MultiMC)"
  homepage "https://polymc.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "PolyMC.app"
end
