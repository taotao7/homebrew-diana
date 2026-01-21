class Diana < Formula
  desc "Mission control for AI agents - unified config management and token monitoring"
  homepage "https://github.com/taotao7/Diana"
  url "https://github.com/taotao7/Diana/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "3b301e39940250f57abc9cf7de3f2267225fe79b2ca8aad1da8f891a3b3a7393"
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
