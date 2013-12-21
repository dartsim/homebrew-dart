require 'formula'

class UrdfdomHeaders < Formula
  homepage 'http://ros.org/wiki/urdf'
  url 'https://github.com/ros/urdfdom_headers/archive/0.2.3.tar.gz'
  sha1 'c68e965e3e98263fb908dc26e6e7e450431b71f2'
  head 'https://github.com/ros/urdfdom_headers.git'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end
