class Pygmo < Formula
  desc "Scientific library for massively parallel optimization"
  homepage "https://esa.github.io/pagmo2/"
  url "https://github.com/esa/pagmo2/archive/v2.10.tar.gz"
  sha256 "2fa95e2b464ddeadb9fc09bd314081293f02a1b6abc11c0b05064729a077227c"
  head "https://github.com/esa/pagmo2.git"

  depends_on "cmake" => :build
  depends_on "pagmo" => :build
  depends_on "boost"
  depends_on "eigen"
  depends_on "nlopt"
  depends_on "numpy"

  def install
    ENV.cxx11
    system "cmake", ".", "-DPAGMO_BUILD_PAGMO=OFF", "-DPAGMO_BUILD_PYGMO=ON",
                         *std_cmake_args
    system "make", "install"
  end

  test do
    system python, "-c", "import pygmo; pygmo.test.run_test_suite(1)"
  end
end
