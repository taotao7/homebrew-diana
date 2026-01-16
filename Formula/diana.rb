class Diana < Formula
  desc "Mission control for AI agents - unified config management and token monitoring"
  homepage "https://github.com/taotao7/Diana"
  url "https://github.com/taotao7/Diana/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "3ab7c996fb1c7fdf708759172ed54fd916f719bca8fb27af68c0780c2e7c66f1"
  license "MIT"
  head "https://github.com/taotao7/Diana.git", branch: "main"

  depends_on "cmake" => :build
  depends_on xcode: :build
  depends_on :macos

  def install
    system "cmake", "-S", ".", "-B", "build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DDIANA_BUILD_TESTS=OFF",
                    *std_cmake_args
    system "cmake", "--build", "build", "--parallel"
    bin.install "build/diana"
    (share/"diana/fonts").install Dir["resources/fonts/*"]
  end

  test do
    assert_predicate bin/"diana", :exist?
  end
end
