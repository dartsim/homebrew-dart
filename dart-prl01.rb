class Dart-prl01 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "http://dartsim.github.io"
  url "https://github.com/personalrobotics/dart/archive/prl-v0.1.tar.gz"
  sha256 "795d9438e8aaf8a88f4ad7036369e86109989df94d0d450436af26f8378276df"
  head "https://github.com/personalrobotics/dart.git", :branch => "dart-prl-0.1"
  option "core-only", "Build dart-core only"

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
    system "make install"
  end
end
