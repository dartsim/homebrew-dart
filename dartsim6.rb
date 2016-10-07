class Dartsim6 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "http://dartsim.github.io"
  url "https://github.com/dartsim/dart/archive/v6.1.0.tar.gz"
  sha256 "f665e81c5bce9d867813b968aaff939e35f2ac4b54735bc4cc23c504686adf9a"
  head "https://github.com/dartsim/dart.git", :branch => "release-6.1"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on "assimp"
  depends_on "boost"
  depends_on "eigen"
  depends_on "fcl"
  depends_on "homebrew/science/libccd"

  # dart-optimizer
  depends_on "homebrew/science/nlopt" => :optional
  depends_on "homebrew/science/ipopt" => :optional

  # dart-collision
  depends_on "bullet" => [:recommended, "with-shared", "with-double-precision"]

  # dart-planning
  depends_on "homebrew/science/flann" => :optional

  # dart-utils
  depends_on "tinyxml" => :recommended
  depends_on "tinyxml2" => :recommended
  depends_on "ros/deps/urdfdom" => :recommended

  # dart-gui
  depends_on "open-scene-graph" => :recommended

  def install
    cmake_args = std_cmake_args
    system "cmake", ".", *cmake_args
    system "make install"
  end
end
