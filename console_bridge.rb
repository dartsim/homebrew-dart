require 'formula'

class Console_bridge < Formula
	homepage 'http://dart.golems.org'
	head 'https://github.com/dartsim/console_bridge.git',
		:using => :git
	url 'https://github.com/dartsim/console_bridge.git',
		:using => :git,
		:revision => "ad7f91e1fbfc6e499b72c08effa45abce862c330"
	version "0.28"

	# Standard (on homebrew)
	depends_on 'cmake' => :build
	depends_on 'boost' => :build

	def install
		system "cmake", ".", *std_cmake_args
		system "make install" # if this fails, try separate make/make install steps
	end

	def test
		system "false"
	end
end
