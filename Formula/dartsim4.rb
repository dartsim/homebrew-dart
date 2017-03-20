class Dartsim4 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "https://dartsim.github.io"
  url "https://github.com/dartsim/dart/archive/v4.3.6.tar.gz"
  sha256 "12e1bac9f50d9f4057bd80ae20385216cfafb885c1ed10a0a69441e51d7729a9"
  head "https://github.com/dartsim/dart.git", :branch => "release-4.3"

  option "with-core-only", "Build dart-core only"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on "assimp"
  depends_on "boost"
  depends_on "eigen"
  depends_on "dartsim/dart/fcl"
  depends_on "homebrew/science/libccd"

  depends_on "homebrew/science/flann" unless build.with? "core-only"
  depends_on "tinyxml" unless build.with? "core-only"
  depends_on "tinyxml2" unless build.with? "core-only"
  depends_on "ros/deps/urdfdom" unless build.with? "core-only"

  conflicts_with "dartsim3", :because => "Differing version of the same formula"

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_CORE_ONLY=True" if build.with? "core-only"
    system "cmake", ".", *cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
