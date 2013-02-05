require 'formula'

class Dartsim < Formula
  homepage 'http://dart.golems.org'
  head 'https://github.com/golems/dart.git',
		:using => :git,
		:revision => "cf08f87b802ed0bb60abbe8ad119ecbe5b2a0113"

  depends_on 'cmake' => :build
  depends_on 'fcl' => :build
  depends_on 'libccd' => :build
  depends_on 'assimp3' => :build
  depends_on 'tinyxml' => :build
  depends_on 'tinyxml2' => :build
  depends_on 'gtest' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "false"
  end
end
