require 'formula'

class UrdfdomHeaders < Formula
	homepage 'http://dart.golems.org'
	head 'https://github.com/dartsim/urdfdom_headers.git',
		:using => :git
	url 'https://github.com/dartsim/urdfdom_headers.git',
		:using => :git,
		:revision => "dad31c24f52dd69bb40a67aff775be530277190b"
	version "0.2.3"

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
