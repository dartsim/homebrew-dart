require 'formula'

class Assimp3 < Formula
  homepage 'http://dart.golems.org'
  url 'http://dart.golems.org/downloads/src/assimpnew.tar.gz'
  version 3.0
  sha1 'f25ba482cdf16d6262617f3a7746babcdad7a78c'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "false"
  end
end
