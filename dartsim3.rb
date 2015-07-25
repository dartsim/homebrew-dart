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
    url "https://gist.githubusercontent.com/jslee02/097cae2403a0bcba034d/raw/8654fd5f54faa36ef069b1f9579e93bd08c1a2c5/dart3_gtest.patch"
    sha256 "CAE7F3ED33868C1F3A2D2DAD775DAACF8323DE7E5E4D7211D27839724CAD6FEA"
  end

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_CORE_ONLY=ON" if build.include? "core-only"
    cmake_args << "-DBUILD_UNITTESTS=OFF"
    system "cmake", ".", *cmake_args
    system "make install"
  end
end
