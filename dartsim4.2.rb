require 'formula'

class Dartsim42 < Formula
  homepage 'http://dartsim.github.io'
  url 'https://github.com/dartsim/dart/archive/v4.2.2.tar.gz'
  sha1 '3cea64600aab98f8a17c3c4dbb0f24ba3af9fcec'
  head 'https://github.com/dartsim/dart.git', :branch => 'release-4.2'

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
