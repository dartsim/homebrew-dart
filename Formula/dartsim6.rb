class Dartsim6 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "https://dartsim.github.io"
  url "https://github.com/dartsim/dart/archive/v6.2.0.tar.gz"
  sha256 "fac3000412280ffd3013273c91e12553bbcd9a6889916b6e95f462dde632980d"
  head "https://github.com/dartsim/dart.git", :branch => "release-6.2"

  bottle do
    root_url "https://dl.bintray.com/dartsim/dart"
    cellar :any
    rebuild 1
    sha256 "ca6e5126a8f4a247b1b8d4937ed93a2f8719499888b8544f8d00b40f25235699" => :sierra
  end

  option "without-optimizer-nlopt"
  option "without-optimizer-ipopt"
  option "without-collision-bullet"
  option "without-collision-ode"
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

  # dart-collision-ode
  depends_on "ode" => ["with-libccd", "with-double-precision"] if build.with? "collision-ode"

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
