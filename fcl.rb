require 'formula'

class Fcl < Formula
  homepage 'http://dart.golems.org'
  url 'http://dart.golems.org/downloads/src/fcl-0.2.7.tar.gz'
  sha1 'bef3fc73980dd67ff44bf811f33f63bbc3a8a9c3'

  depends_on 'cmake' => :build
  depends_on 'libccd' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "false"
  end
end
