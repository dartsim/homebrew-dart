require 'formula'

class Libccd < Formula
  homepage 'http://dart.golems.org'
  url 'http://dart.golems.org/downloads/src/libccd-1.4.tar.gz'
  sha1 'c228bed3fc6a3df0d3ec03d0c3081fdc2615924a'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "false"
  end
end
