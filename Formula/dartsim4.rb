class Dartsim4 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "https://dartsim.github.io/"
  url "https://github.com/dartsim/dart/archive/v4.3.7.tar.gz"
  sha256 "f98382c743194ce1e37e06e3002030efba6eb6819942eb665c3933df84789683"

  option "with-core-only", "Build dart-core only"

  deprecated_option "core-only" => "with-core-only"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on "assimp"
  depends_on "boost"
  depends_on "eigen"
  depends_on "fcl"
  depends_on "libccd"

  depends_on "flann" if build.without? "core-only"
  depends_on "tinyxml" if build.without? "core-only"
  depends_on "tinyxml2" if build.without? "core-only"
  depends_on "urdfdom" if build.without? "core-only"

  conflicts_with "dartsim5", :because => "Differing version of the same formula"
  conflicts_with "dartsim", :because => "Homebrew-core version of the same formula"

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_CORE_ONLY=True" if build.with? "core-only"
    system "cmake", ".", *cmake_args
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <dart/dart.h>
      int main() {
        dart::simulation::World* world = new dart::simulation::World();
        assert(world != NULL);
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-I#{Formula["eigen"].include}",
                    "-I#{include}", "-L#{lib}", "-ldart",
                    "-lassimp", "-o", "test"
    system "./test"
  end
end
