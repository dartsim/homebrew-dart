require 'formula'

class Dartsim < Formula
	homepage 'http://dart.golems.org'
	head 'https://github.com/dartsim/dart.git',
		:using => :git
	url 'https://github.com/dartsim/dart.git',
		:using => :git,
		:revision => "10e69f0c3dd513635147731aeb4401f96b71f76d"
	version "2.5"

	# Standard (on homebrew)
	depends_on 'cmake' => :build
	depends_on 'flann' => :build
	depends_on 'boost' => :build
	depends_on 'eigen' => :build

	# Non-standard (install through golems)
	depends_on 'fcl' => :build
	depends_on 'libccd' => :build
	depends_on 'assimp' => :build
	depends_on 'tinyxml' => :build
	depends_on 'tinyxml2' => :build
	depends_on 'gtest' => :build
	depends_on 'console_bridge' => :build
	depends_on 'urdfdom_headers' => :build
	depends_on 'urdfdom' => :build

	def install
		system "cmake", ".", *std_cmake_args
		system "make install" # if this fails, try separate make/make install steps
	end

	def test
		system "false"
	end
end
