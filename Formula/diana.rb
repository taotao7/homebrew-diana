class Diana < Formula
  desc "Mission control for AI agents - unified config management and token monitoring"
  homepage "https://github.com/taotao7/Diana"
  url "https://github.com/taotao7/Diana/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "daba387b240d3b05238d802edb76b62ba31575cca8f1204a370843900e597d8d"
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
