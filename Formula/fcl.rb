class Fcl < Formula
  homepage "http://gamma.cs.unc.edu/FCL"
  url "https://github.com/flexible-collision-library/fcl/archive/0.5.0.tar.gz"
  sha256 "8e6c19720e77024c1fbff5a912d81e8f28004208864607447bc90a31f18fb41a"
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
