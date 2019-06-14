class Dartpy < Formula
  desc "Python APIs for Dynamic Animation and Robotics Toolkit"
  homepage "https://dartsim.github.io/"
  url "https://github.com/dartsim/dart/archive/v6.9.1.tar.gz"
  sha256 "9e2954aaf2d4538a7e4aab5188f1061c3e216c8c0b72483c2d0b9e814525acd1"
  version "0.0.1"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "pybind11" => :build
  depends_on "assimp"
  depends_on "boost"
  depends_on "bullet"
  depends_on "eigen"
  depends_on "fcl"
  depends_on "flann"
  depends_on "ipopt"
  depends_on "libccd"
  depends_on "nlopt"
  depends_on "ode"
  depends_on "open-scene-graph"
  depends_on "tinyxml2"
  depends_on "urdfdom"

  def install
    ENV.cxx11
    mkdir "build" do
      # Force to link to system GLUT (see: https://cmake.org/Bug/view.php?id=16045)
      system "cmake", "..", "-DGLUT_glut_LIBRARY=/System/Library/Frameworks/GLUT.framework",
                           "-DDART_BUILD_DARTPY=ON", *std_cmake_args
      system "make", "dartpy", "install"
    end
  end

  test do
    system python, "-c", "import dartpy"
  end
end