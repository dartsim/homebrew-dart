class TinyDnn < Formula
  desc "Header only, Dependency-free Deep Learning Framework in C++14"
  homepage "https://tiny-dnn.readthedocs.io/en/latest/"
  url "https://github.com/tiny-dnn/tiny-dnn/archive/9468e93f8739ca171aec7dbafc75a0aa4ec5709e.tar.gz"
  version "1.0.0a3.1" # until 1.0.0a4 (or greater) released
  sha256 "82d04d92ea2102d18920600ec4c9d0825439a4678cf4637a5f11d03ee3377df3"

  depends_on "cmake" => :build
  depends_on "cereal"

  needs :cxx14

  def install
    cmake_args = ["-DUSE_TBB=OFF", "-DUSE_AVX=OFF", "-DBUILD_TESTS=OFF",
                  "-DDNN_USE_IMAGE_API=OFF"]
    system "cmake", ".", *std_cmake_args, *cmake_args
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <tiny_dnn/tiny_dnn.h>
      int main() {
        using namespace tiny_dnn;
        using namespace tiny_dnn::layers;
        using namespace tiny_dnn::activation;

        // Declare the model as network. There are 2 types of network:
        // network<sequential> and network<graph>. The sequential model is easier to
        // construct.
        tiny_dnn::network<tiny_dnn::sequential> net;

        // Save the trained parameter and models:
        net.save("my-network");

        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-L#{lib}", "-std=c++14", "-o", "test"
    system "./test"
  end
end
