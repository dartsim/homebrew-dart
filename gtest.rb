require 'formula'

class Gtest < Formula
  homepage ''
  url 'http://dart.golems.org/downloads/src/gtest-1.6.0.tar.gz'
  version '1.6.0'
  sha1 'd5e4af46566c05d058e875bd839190f61b3ff02e'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "false"
  end
end
