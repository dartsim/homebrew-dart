class TinyDnn < Formula
  desc "Header only, Dependency-free Deep Learning Framework in C++14"
  homepage "https://tiny-dnn.readthedocs.io/en/latest/"
  url "https://github.com/tiny-dnn/tiny-dnn/archive/v1.0.0a3.tar.gz"
  sha256 "e2c61ce8c5debaa644121179e9dbdcf83f497f39de853f8dd5175846505aa18b"

  depends_on "cmake" => :build
  depends_on "cereal"

  needs :cxx14

  def install
    ENV.cxx14
    cmake_args = ["-DUSE_TBB=OFF", "-DUSE_AVX=OFF", "-DBUILD_TESTS=OFF"]
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

        using tiny_dnn::activation::tan_h;
        using tiny_dnn::cross_entropy;

        // Declare the model as network. There are 2 types of network:
        // network<sequential> and network<graph>. The sequential model is easier to
        // construct.
        tiny_dnn::network<tiny_dnn::sequential> net;

        // Stack layers:
        net << conv<tan_h>(
                   32, 32, 5, 1, 6, padding::same) // in:32x32x1, 5x5conv, 6fmaps
            << max_pool<tan_h>(32, 32, 6, 2)       // in:32x32x6, 2x2pooling
            << conv<tan_h>(
                  16, 16, 5, 6, 16, padding::same) // in:16x16x6, 5x5conv, 16fmaps
            << max_pool<tan_h>(16, 16, 16, 2)       // in:16x16x16, 2x2pooling
            << fc<tan_h>(8 * 8 * 16, 100)           // in:8x8x16, out:100
            << fc<softmax>(100, 10);                // in:100 out:10

        // Save the trained parameter and models:
        net.save("my-network");

        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-L#{lib}", "-std=c++14", "-o", "test"
    system "./test"
  end
end
