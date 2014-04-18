require "formula"

class Rgbds < Formula
  homepage "http://anthony.bentley.name/rgbds/"
  url "https://github.com/bentley/rgbds.git", :using => :git
  sha1 "20b31df597d519d3e36f4ed05dfd28029eb61a32"
  version "HEAD"

  skip_clean :all
  def install
    bin.mkpath # will fail to install unless directories created
    man1.mkpath
    man7.mkpath

    ENV.deparallelize
    ENV.no_optimization
    system "make"  # separate make and make install steps
    system "make install PREFIX=#{prefix} MANPREFIX=#{man}"
  end

  def caveats
    s = <<-EOS.undent
      Installed from HEAD of #{url}
      Links rgbasm, rgblink, rgblib, rgbfix to #{HOMEBREW_PREFIX}/bin
    EOS
    s += "Formula has not been tested on anything below mavericks." if MacOS.version < :mountain_lion
    s
  end
  
end
