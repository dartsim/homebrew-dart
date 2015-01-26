require 'formula'

class Fcl < Formula
  homepage 'http://gamma.cs.unc.edu/FCL'
  url 'https://github.com/flexible-collision-library/fcl/archive/0.3.2.tar.gz'
  sha1 '67c4a3c9b2c9c829cae3e08a374fc6aa23f3f4b1'
  head 'https://github.com/flexible-collision-library/fcl.git'

  depends_on 'boost'
  depends_on 'cmake' => :build
  depends_on 'homebrew/science/flann' => :optional
  depends_on 'homebrew/science/libccd'

  patch do
    # Fix cmake issue with libccd (JS to expand on this)
    url 'https://github.com/dartsim/fcl/commit/7a192288ece9b03885fd1c87b59e09d4c7dfdaca.diff'
    sha1 '66379439ab4967d50df3ffeaa5d2fb9180251352'
  end

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end
