class Fcl04 < Formula
  desc "Flexible Collision Library"
  homepage "http://gamma.cs.unc.edu/FCL"
  url "https://github.com/flexible-collision-library/fcl/archive/0.4.0.tar.gz"
  sha256 "1bea2cd5ee6034166d42860a6c5577f807c81f9f54d09dd680fb9bdf58d46747"
  head "https://github.com/flexible-collision-library/fcl.git"

  depends_on "boost"
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "flann" => :optional
  depends_on "homebrew/science/libccd"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
