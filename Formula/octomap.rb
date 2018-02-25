class Octomap < Formula
  desc "An Efficient Probabilistic 3D Mapping Framework Based on Octrees"
  homepage "https://octomap.github.io/"
  url "https://github.com/OctoMap/octomap/archive/v1.9.0.tar.gz"
  sha256 "5f81c9a8cbc9526b2e725251cd3a829e5222a28201b394314002146d8b9214dd"

  depends_on "cmake" => :build

  needs :cxx11

  def install
    ENV.cxx11
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <octomap/octomap.h>
      int main() {
        octomap::OcTree tree(0.05);
        assert(tree.size(), 0);
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-I#{Formula["eigen"].include}/eigen3",
                    "-I#{include}", "-L#{lib}", "-ldart",
                    "-lassimp", "-std=c++11", "-o", "test"
    system "./test"
  end
end
