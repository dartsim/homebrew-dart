require 'formula'

class Fcl < Formula
  homepage 'http://gamma.cs.unc.edu/FCL'
  url 'https://github.com/flexible-collision-library/fcl/archive/0.2.9.tar.gz'
  sha1 'ee45a4d7a2d3c56223929b452463035b3d8af1fb'
  head 'https://github.com/flexible-collision-library/fcl.git'

  depends_on 'boost'
  depends_on 'cmake' => :build
  depends_on 'homebrew/science/libccd'

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end
