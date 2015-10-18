require 'formula'

class Fcl < Formula
  homepage "http://gamma.cs.unc.edu/FCL"
  url "https://github.com/flexible-collision-library/fcl/archive/0.3.2.tar.gz"
  sha256 "cf914f85b32cf8b63879907726df64e50da33f00d538759d789fe10fc5fbc95b"
  head "https://github.com/flexible-collision-library/fcl.git"

  depends_on "boost"
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "homebrew/science/flann" => :optional
  depends_on "homebrew/science/libccd"

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  test do
    system "false"
  end
end
