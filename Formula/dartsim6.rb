class Dartsim6 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "https://dartsim.github.io"
  url "https://github.com/dartsim/dart/archive/v6.3.0.tar.gz"
  sha256 "aa92634c1c97d99966cf16c4a0845792941358c063409fa00c28b4039c961c25"
  head "https://github.com/dartsim/dart.git", :branch => "release-6.3"

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
  depends_on "dartsim/dart/libccd"

  # dart-optimizer-nlopt
  depends_on "nlopt" if build.with? "optimizer-nlopt"

  # dart-optimizer-ipopt
  depends_on "homebrew/science/ipopt" if build.with? "optimizer-ipopt"

  # dart-collision-bullet
  depends_on "bullet" if build.with? "collision-bullet"

  # dart-collision-ode
  depends_on "ode" if build.with? "collision-ode"

  # dart-planning
  depends_on "flann" if build.with? "planning"

  # dart-utils
  if build.with? "utils"
    depends_on "tinyxml"
    depends_on "tinyxml2"

    # dart-utils-urdf
    depends_on "ros/deps/urdfdom" if build.with? "utils-urdf"
  end

  # dart-gui
  if build.with? "gui"
    depends_on "freeglut"

    # dart-gui-osg
    depends_on "open-scene-graph" if build.with? "gui-osg"
  end

  conflicts_with "dartsim4", :because => "Differing version of the same formula"
  conflicts_with "dartsim5", :because => "Differing version of the same formula"

  def install
    cmake_args = std_cmake_args
    system "cmake", ".", *cmake_args
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<-EOS.undent
      #include <dart/dart.hpp>
      int main() {
        auto world = std::make_shared<dart::simulation::World>();
        assert(world != nullptr);
        return 0;
      }
    EOS
    system ENV.cc, "test.cpp", "-I#{include}/eigen3", "-L#{lib}", "-ldart", "-lassimp", "-lc++", "-std=c++11", "-o", "test"
    system "./test"
  end
end
