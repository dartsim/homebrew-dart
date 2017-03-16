class Dartsim6 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "https://dartsim.github.io"
  url "https://github.com/dartsim/dart/archive/v6.1.2.tar.gz"
  sha256 "c84e9a5e8e11651f86ed0a603898470f25ed844b7d5797081df0b7fc9a106e55"
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
    system "make", "install"
  end

  test do
    system "false"
  end
end
