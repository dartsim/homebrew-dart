require 'formula'

class Grip < Formula
	homepage 'http://dart.golems.org'
	head 'https://github.com/golems/grip.git',
		:using => :git
	url 'https://github.com/golems/grip.git',
		:using => :git,
		:revision => "02d64ff47c6bbd73a9c03e081f018990e28f6247"
	version "2.4"

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
