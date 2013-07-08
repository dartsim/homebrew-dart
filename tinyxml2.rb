require 'formula'

class Tinyxml2 < Formula
  homepage 'http://dart.golems.org'
  url 'http://dart.golems.org/downloads/src/tinyxmlnew.tar.gz'
  version '2.0'
  sha1 'fb4a0bcb1dc9ac8a895f2661414fb2d6da95da81'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "false"
  end
end
