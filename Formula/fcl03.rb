class Fcl03 < Formula
  desc "Flexible Collision Library"
  homepage "http://gamma.cs.unc.edu/FCL"
  url "https://github.com/flexible-collision-library/fcl/archive/0.3.4.tar.gz"
  sha256 "0c688324ebc43e1de4c210ae36b00e0d4812a3d00cf0646e256b55f7a72258d3"
  head "https://github.com/flexible-collision-library/fcl.git"

  depends_on "boost"
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "flann" => :optional
  depends_on "dartsim/dart/libccd"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "true"
  end
end
