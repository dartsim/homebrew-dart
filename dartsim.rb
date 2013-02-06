require 'formula'

class Dartsim < Formula
  homepage 'http://dart.golems.org'
  head 'https://github.com/golems/dart.git',
		:using => :git
  url 'https://github.com/golems/dart.git',
		:using => :git,
		:revision => "ca3042ed7f0f19895eec626edf1b72b93392dd35"
	version "2.2.1"

	# Standard (on homebrew)
  depends_on 'cmake' => :build
  depends_on 'flann' => :build
  depends_on 'boost' => :build
  depends_on 'eigen' => :build

	# Non-standard (install through golems)
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
