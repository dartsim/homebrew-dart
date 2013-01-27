require 'formula'

class Tinyxml < Formula
  homepage 'http://dart.golems.org'
  url 'http://dart.golems.org/downloads/src/tinyxml.tar.gz'
  version 1.0
  sha1 'f2b98ca0fe0d73818a19ada79bbd5d3e1a317102'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "false"
  end
end
