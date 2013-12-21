require 'formula'

class Urdfdom < Formula
  homepage 'http://ros.org/wiki/urdf'
  url 'https://github.com/ros/urdfdom/archive/0.2.10.tar.gz'
  sha1 '79e33e91f79c4775983ffeffcf02b155af942af2'
  head 'https://github.com/ros/urdfdom.git'

  depends_on 'cmake' => :build
  depends_on 'urdfdom_headers' => :build

  depends_on 'boost'
  depends_on 'console_bridge'

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end
