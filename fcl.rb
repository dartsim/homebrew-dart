require 'formula'

class Fcl < Formula
  homepage 'http://gamma.cs.unc.edu/FCL'
  url 'https://github.com/dartsim/fcl/archive/0.3.2-dart.tar.gz'
  sha1 '1fd4198cda29bbf2b9ef97dd0acd58168519ff70'
  head 'https://github.com/flexible-collision-library/fcl.git'

  depends_on 'boost'
  depends_on 'cmake' => :build
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
