class Libccd < Formula
  desc "Library for collision detection between two convex shapes"
  homepage "http://libccd.danfis.cz"
  url "https://github.com/danfis/libccd/archive/v2.0.tar.gz"
  sha256 "1b4997e361c79262cf1fe5e1a3bf0789c9447d60b8ae2c1f945693ad574f9471"
  revision 2
  head "https://github.com/danfis/libccd.git"

  option "with-single-precision", "Use single precision"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args

    if build.with? "single-precision"
      args << "-DCCD_SINGLE=True"
    else
      args << "-DCCD_DOUBLE=True"
    end

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      #include <ccd/vec3.h>
      int main() {
        ccdVec3PointSegmentDist2(
          ccd_vec3_origin, ccd_vec3_origin,
          ccd_vec3_origin, NULL);
        return 0;
      }
    EOS
    system ENV.cc, "-o", "test", "test.c", "-L#{lib}", "-lccd"
    system "./test"
  end
end
