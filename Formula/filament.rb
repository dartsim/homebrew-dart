class Filament < Formula
  desc "Real-time physically based rendering engine"
  homepage "https://google.github.io/filament/Filament.md.html"
  url "https://github.com/google/filament/archive/v0.1.0-alpha2.tar.gz"
  sha256 "6c07748077ee27a990dd7b027f651706fa0140ebcdef5a9ec0bae3c5c0cc6242"
  head "https://github.com/google/filament.git"

  depends_on :arch => :x86_64
  depends_on "cmake" => :build

  needs :cxx14

  def install
    ENV.cxx11
    mkdir "brewbuild"
    cd "brewbuild" do
      system "cmake", "..", "-DCMAKE_BUILD_TYPE=Release", *std_cmake_args
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
