class Dartsim5 < Formula
  desc "DART: Dynamic Animation and Robotics Toolkit"
  homepage "https://dartsim.github.io/"
  url "https://github.com/dartsim/dart/archive/v5.1.6.tar.gz"
  sha256 "b3b04a321fed0e63483413cc7a9bea780a0b97b7baacf64a574cc042f612d1e3"

  option "with-core-only", "Build dart-core only"

  deprecated_option "core-only" => "with-core-only"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on "assimp"
  depends_on "boost"
  depends_on "eigen"
  depends_on "fcl"
  depends_on "libccd"

  depends_on "bullet" => :optional

  depends_on "flann" if build.without? "core-only"
  depends_on "tinyxml" if build.without? "core-only"
  depends_on "tinyxml2" if build.without? "core-only"
  depends_on "urdfdom" if build.without? "core-only"
  depends_on "nlopt" if build.without? "core-only" => :optional
  depends_on "dartsim/dart/ipopt" if build.without? "core-only" => :optional
  depends_on "open-scene-graph" if build.without? "core-only" => :optional

  conflicts_with "dartsim4", :because => "Differing version of the same formula"
  conflicts_with "dartsim", :because => "Homebrew-core version of the same formula"

  def install
    ENV.cxx11
    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_CORE_ONLY=True" if build.with? "core-only"
    system "cmake", ".", *cmake_args
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <dart/dart-core.h>
      int main() {
        auto world = std::make_shared<dart::simulation::World>();
        assert(world != nullptr);
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-I#{Formula["eigen"].include}",
                    "-I#{include}", "-L#{lib}", "-ldart",
                    "-lassimp", "-std=c++11", "-o", "test"
    system "./test"
  end
end
