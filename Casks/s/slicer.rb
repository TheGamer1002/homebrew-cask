cask "slicer" do
  version "5.6.0,65633d0f686586850602107c"
  sha256 "54b5e0c9b484c2c4a0b6e82a08bf4be593cfcc0b0b330add99852c26f3ff7580"

  url "https://slicer-packages.kitware.com/api/v1/item/#{version.csv.second}/download",
      verified: "slicer-packages.kitware.com/"
  name "3D Slicer"
  desc "Medical image processing and visualization system"
  homepage "https://www.slicer.org/"

  livecheck do
    url "https://download.slicer.org"
    regex(%r{href=.*?/bitstream/(\h+)["' >].+?["']header["'][^>]*?>\s*v?(\d+(?:\.\d+)+)}im)
    strategy :page_match do |page, regex|
      match = page.scan(regex)
      next if match.length < 2

      "#{match[1][1]},#{match[1][0]}"
    end
  end

  app "Slicer.app"

  zap trash: [
    "~/Library/Application Support/NA-MIC",
    "~/Library/Preferences/org.slicer.slicer.plist",
    "~/Library/Preferences/Slicer.plist",
    "~/Library/Saved Application State/org.slicer.slicer.savedState",
    "~/.config/www.na-mic.org",
  ]
end
