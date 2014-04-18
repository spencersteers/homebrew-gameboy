require "formula"

class EmsFlasher < Formula
  homepage "http://lacklustre.net/projects/ems-flasher/"
  url "https://github.com/Villadelfia/ems-flasher.git", :using => :git
  sha1 "ead68fd0e01fc381b66ce9fb03274a5c8de89b80"
  version "HEAD"

  depends_on "pkgconfig"
  depends_on "libusb"

  def install
    system "make"
    bin.install "ems-flasher"
  end

  def caveats
    s = <<-EOS.undent
      Installed from HEAD of #{url}
    EOS
    s += "This formula has not been tested on anything below mavericks." if MacOS.version < :mountain_lion
    s
  end
end
