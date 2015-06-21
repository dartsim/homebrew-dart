require 'formula'

class Dartsim4 < Formula
  homepage 'http://dartsim.github.io'
  url 'https://github.com/dartsim/dart/archive/v4.3.4.tar.gz'
  sha1 'f46e436b2727fb95d7b6885705660fa86c22d1fa'
  head 'https://github.com/dartsim/dart.git', :branch => 'release-4.3'

  option 'core-only', 'Build dart-core only'

  depends_on 'cmake' => :build
  depends_on 'eigen' => :build

  depends_on 'assimp'
  depends_on 'boost'
  depends_on 'fcl'
  depends_on 'flann' unless build.include? 'core-only'
  depends_on 'homebrew/science/libccd'
  depends_on 'tinyxml' unless build.include? 'core-only'
  depends_on 'tinyxml2' unless build.include? 'core-only'
  depends_on 'ros/deps/urdfdom' unless build.include? 'core-only'

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DBUILD_CORE_ONLY=True" if build.include? 'core-only'
    system "cmake", ".", *cmake_args
    system "make install"
  end
end
