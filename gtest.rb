require 'formula'

class Gtest < Formula
  homepage 'http://code.google.com/p/googletest/'
  url 'https://googletest.googlecode.com/files/gtest-1.6.0.zip'
  sha1 '00d6be170eb9fc3b2198ffdcb1f1d6ba7fc6e621'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end
