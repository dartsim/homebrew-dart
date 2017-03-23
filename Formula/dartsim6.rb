class Dartsim6 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "https://dartsim.github.io"
  url "https://github.com/dartsim/dart/archive/v6.1.2.tar.gz"
  sha256 "c84e9a5e8e11651f86ed0a603898470f25ed844b7d5797081df0b7fc9a106e55"
  head "https://github.com/dartsim/dart.git", :branch => "release-6.1"

  bottle do
    root_url "https://dl.bintray.com/jslee02/homebrew-dart"
    cellar :any
    rebuild 1
    sha256 "ca6e5126a8f4a247b1b8d4937ed93a2f8719499888b8544f8d00b40f25235699" => :sierra
  end

  option "without-optimizer-nlopt"
  option "without-optimizer-ipopt"
  option "without-collision-bullet"
  option "without-planning"
  option "without-utils"
  option "without-utils-urdf"
  option "without-gui"
  option "without-gui-osg"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on "assimp"
  depends_on "boost"
  depends_on "eigen"
  depends_on "dartsim/dart/fcl"
  depends_on "homebrew/science/libccd"

  # dart-optimizer-nlopt
  depends_on "homebrew/science/nlopt" if build.with? "optimizer-nlopt"

  # dart-optimizer-ipopt
  depends_on "homebrew/science/ipopt" if build.with? "optimizer-ipopt"

  # dart-collision-bullet
  depends_on "bullet" => ["with-shared", "with-double-precision"] if build.with? "collision-bullet"

  # dart-planning
  depends_on "homebrew/science/flann" if build.with? "planning"

  # dart-utils
  if build.with? "utils"
    depends_on "tinyxml"
    depends_on "tinyxml2"

    # dart-utils-urdf
    if build.with? "utils-urdf"
        depends_on "ros/deps/urdfdom"
    end
  end

  # dart-gui
  if build.with? "gui"
    depends_on "freeglut"

    # dart-gui-osg
    if build.with? "gui-osg"
     depends_on "open-scene-graph"
    end
  end

  conflicts_with "dartsim4", :because => "Differing version of the same formula"
  conflicts_with "dartsim5", :because => "Differing version of the same formula"

  def install
    cmake_args = std_cmake_args
    system "cmake", ".", *cmake_args
    system "make", "install"
  end

  test do
    system "true"
  end
end
