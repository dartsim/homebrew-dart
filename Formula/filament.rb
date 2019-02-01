class Filament < Formula
  desc "Real-time physically based rendering engine"
  homepage "https://google.github.io/filament/Filament.md.html"
  url "https://github.com/google/filament/archive/v1.0.0.tar.gz"
  sha256 "6364dc07ac240dad5bb28f7d6978c6147a7cfb3131313dba62019c0a2669539e"
  head "https://github.com/google/filament.git"

  depends_on :arch => :x86_64
  depends_on "cmake" => :build

  patch do
    # Install filamat, which is necessary for MeshAssimp.h
    url "https://gist.githubusercontent.com/jslee02/33a77a2aa6bb8efde68cea024b6d05c4/raw/ecf4a6173b8d2c569b1f0e6eb770535a9b2e85f5/filamat_install.patch"
    sha256 "2b08d13978890e579cb51989e602548bd41734f4252386d6af40f4517bb060f8"
  end

  def install
    ENV.cxx11
    mkdir "brewbuild"
    cd "brewbuild" do
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
