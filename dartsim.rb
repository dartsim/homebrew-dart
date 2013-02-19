require 'formula'

class Dartsim < Formula
	homepage 'http://dart.golems.org'
	head 'https://github.com/golems/dart.git',
		:using => :git
	url 'https://github.com/golems/dart.git',
		:using => :git,
		:revision => "80bd000b58df5318bf81e152d5310d07f2e30d2e"
	version "2.3"

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
