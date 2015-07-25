class Dartsim3 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "http://dartsim.github.io"
  url "https://github.com/dartsim/dart/archive/v3.0.tar.gz"
  sha256 "8134101688efcada16a321831de9bcc6c70e6834b825a9209c3759f7f52e6815"
  head "https://github.com/dartsim/dart.git", :branch => "release-3.0"
  option "core-only", "Build dart-core only"

  depends_on "cmake" => :build

  depends_on "assimp"
  depends_on "boost"
  depends_on "eigen"
  depends_on "fcl"
  depends_on "homebrew/science/libccd"
  depends_on "flann" unless build.include? "core-only"
  depends_on "tinyxml" unless build.include? "core-only"
  depends_on "tinyxml2" unless build.include? "core-only"
  depends_on "ros/deps/urdfdom" unless build.include? "core-only"

  patch do
    url "https://gist.githubusercontent.com/jslee02/097cae2403a0bcba034d/raw/8bac3a963a94209c392122eed91f4b75f631680b/dart3_gtest.patch"
    sha256 "c99b607380550ad8c6734581a2faac2e5c90a38bca9ff03165b37909056192f4"
  end

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_CORE_ONLY=ON" if build.include? "core-only"
    cmake_args << "-DBUILD_UNITTESTS=OFF"
    system "cmake", ".", *cmake_args
    system "make install"
  end
end
