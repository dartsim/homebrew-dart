require 'formula'

class Dartsim < Formula
  homepage 'http://dartsim.github.io'
  url 'https://github.com/dartsim/dart/archive/v4.3.2.tar.gz'
  sha1 'fe89a5e254c58fdb26b4e33aa3d7fc61665f9f30'
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
