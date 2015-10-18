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
  
  depends_on "homebrew/science/flann" unless build.include? "core-only"
  depends_on "tinyxml" unless build.include? "core-only"
  depends_on "tinyxml2" unless build.include? "core-only"
  depends_on "ros/deps/urdfdom" unless build.include? "core-only"

  patch do
    # Add cmake build option whether DART build the unit tests or not
    url "https://gist.githubusercontent.com/jslee02/097cae2403a0bcba034d/raw/9f447abee22d80db74a566d2fe4c176f5fcd9b03/dart3_gtest.patch"
    sha256 "87c53f452a2117627567d4329eef7e745346a67e1e49a9cfab6ec58f93b7c1f0"
  end

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_CORE_ONLY=ON" if build.include? "core-only"
    cmake_args << "-DBUILD_UNITTESTS=OFF"
    system "cmake", ".", *cmake_args
    system "make install"
  end
end
