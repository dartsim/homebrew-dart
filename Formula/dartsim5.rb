class Dartsim5 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "https://dartsim.github.io"
  url "https://github.com/dartsim/dart/archive/v5.1.5.tar.gz"
  sha256 "8b55930ecdec99edabd88a62e3fe362e6104ccaa4bd0d5f68a2c1ef5bff2f0f4"
  head "https://github.com/dartsim/dart.git", :branch => "release-5.1"

  option "without-extensions", "Build dart-core only"

  deprecated_option "core-only" => "without-components"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on "assimp"
  depends_on "boost"
  depends_on "eigen"
  depends_on "fcl"
  depends_on "homebrew/science/libccd"

  depends_on "bullet" => [:optional, "with-shared", "with-double-precision"]
  depends_on "homebrew/science/flann" unless build.include? "core-only"
  depends_on "tinyxml" unless build.include? "core-only"
  depends_on "tinyxml2" unless build.include? "core-only"
  depends_on "ros/deps/urdfdom" unless build.include? "core-only"
  depends_on "homebrew/science/nlopt" unless build.include? "core-only" => :optional
  depends_on "homebrew/science/ipopt" unless build.include? "core-only" => :optional
  depends_on "open-scene-graph" unless build.include? "core-only" => :optional

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_CORE_ONLY=True" if build.include? "core-only"
    system "cmake", ".", *cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
