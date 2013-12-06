require 'formula'

class Libccd < Formula
  homepage 'http://libccd.danfis.cz'
  url 'http://libccd.danfis.cz/files/libccd-1.4.tar.gz'
  sha1 'abf924ad6e3f427d58734f67348de23970704cbd'
  head 'https://github.com/danfis/libccd.git'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end
