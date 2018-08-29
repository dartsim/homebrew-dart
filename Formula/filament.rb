class Filament < Formula
  desc "Real-time physically based rendering engine"
  homepage "https://google.github.io/filament/Filament.md.html"
  url "https://github.com/google/filament/archive/775c53f62c37284418ad7f4ada83934501536d95.tar.gz"
  sha256 "6241e7cd6f5bce2e17323eeb3d8239f55bf870c40459dd738fc9b572f26bea8f"
  head "https://github.com/google/filament.git"

  depends_on :arch => :x86_64
  depends_on "cmake" => :build

  needs :cxx14

  def install
    ENV.cxx11
    mkdir "brewbuild"
    cd "brewbuild" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "true"
  end
  test do
    (testpath/"test.cpp").write <<~EOS
      #include <cassert>
      #include <filament/Engine.h>
      using namespace filament;
      int main() {
        Engine* engine = Engine::create();
        assert(engine != nullptr);
        Engine::destroy(&engine);
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp",
                    "-I#{include}", "-L#{lib}", "-L#{lib}/x86_64",
                    "-lfilament", "-lutils", "-lbluevk", "-lbluegl",
                    "-lfilabridge", "-lfilaflat",
                    "-framework", "OpenGL", "-framework", "Cocoa",
                    "-std=c++14", "-o", "test"
    system "./test"
  end
end
