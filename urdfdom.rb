require 'formula'

class Urdfdom < Formula
	homepage 'http://dart.golems.org'
	head 'https://github.com/dartsim/urdfdom.git',
		:using => :git
	url 'https://github.com/dartsim/urdfdom.git',
		:using => :git,
		:revision => "8513913d1943f55202599cd0b36cac9609e85cbb"
	version "0.2.8"

	# Standard (on homebrew)
	depends_on 'cmake' => :build
	depends_on 'boost' => :build

    # Non-standard (install through golems)
	depends_on 'console_bridge' => :build
	depends_on 'urdfdom_headers' => :build

	def install
		system "cmake", ".", *std_cmake_args
		system "make install" # if this fails, try separate make/make install steps
	end

	def test
		system "false"
	end
end
