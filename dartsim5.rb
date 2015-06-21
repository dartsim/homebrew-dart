require 'formula'

class Dartsim5 < Formula
  homepage 'http://dartsim.github.io'
  url 'https://github.com/dartsim/dart/archive/v5.0.0.tar.gz'
  sha256 'd7a16a49ac424e74e679251f1113084841afe63697d84f1c128e3c65199e8916'
  head 'https://github.com/dartsim/dart.git', :branch => 'release-5.0'

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
