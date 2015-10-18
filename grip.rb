class Grip < Formula
  homepage "http://dart.golems.org"
  head "https://github.com/dartsim/grip.git"
  url "https://github.com/dartsim/grip.git",
    :revision => "21ed8a6c3ae45196ee879f1674ae1ebc67f36d0d"
  version "2.5"

  depends_on "cmake" => :build
  depends_on "dartsim/dart/dartsim3" => :build
  depends_on "wxmac" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "false"
  end
end
