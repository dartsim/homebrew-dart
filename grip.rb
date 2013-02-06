require 'formula'

class Grip < Formula
  homepage 'http://dart.golems.org'
  head 'https://github.com/golems/grip.git',
		:using => :git
  url 'https://github.com/golems/grip.git',
		:using => :git,
		:revision => "8c8ccb960e83e67060a3b8ad390b9327634d0802"
	version "2.2.1"

  depends_on 'cmake' => :build
  depends_on 'dartsim' => :build
  depends_on 'wxmac' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "false"
  end
end
