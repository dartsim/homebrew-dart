class Filament < Formula
  desc "Real-time physically based rendering engine"
  homepage "https://google.github.io/filament/Filament.md.html"
  url "https://github.com/google/filament/archive/v1.3.0.tar.gz"
  sha256 "a12b704368fcf99cfd97354fc7436365d19dc76b05525f0cd9fb5574b65ccb27"
  head "https://github.com/google/filament.git"

  depends_on :arch => :x86_64
  depends_on "cmake" => :build

  def install
    ENV.cxx11
    mkdir "brewbuild" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <filament/Engine.h>
      using namespace filament;
      int main() {
        Engine* engine = Engine::create();
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
