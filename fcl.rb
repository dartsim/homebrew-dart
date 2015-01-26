require 'formula'

class Fcl < Formula
  homepage 'http://gamma.cs.unc.edu/FCL'
  url 'https://github.com/flexible-collision-library/fcl/archive/0.3.2.tar.gz'
  sha1 '67c4a3c9b2c9c829cae3e08a374fc6aa23f3f4b1'
  head 'https://github.com/flexible-collision-library/fcl.git'

  depends_on 'boost'
  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'homebrew/science/flann' => :optional
  depends_on 'homebrew/science/libccd'

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end
