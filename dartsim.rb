require 'formula'

class Dartsim < Formula
  homepage 'http://dartsim.github.io'
  url 'https://github.com/dartsim/dart/archive/v4.1.0.tar.gz'
  sha1 '16cd6f77fb7c1ba0e166e3d219cbc8ed6964055d'
  head 'https://github.com/dartsim/dart.git', :branch => 'master'

  option 'core-only', 'Build dart-core only'

  depends_on 'cmake' => :build
  depends_on 'eigen' => :build
  depends_on 'gtest' => :build unless build.include? 'core-only'

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

  def test
    system "false"
  end
end
