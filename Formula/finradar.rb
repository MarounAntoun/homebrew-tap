# typed: false
# frozen_string_literal: true

# Auto-patched by the finradar-cli release CI (cli-release.yml) on every cli-v* tag:
# the `version` line and both sha256 values are replaced with the released artifacts.
# Keep column-0 indentation so `brew audit --strict` passes.
class Finradar < Formula
  desc "FinRadar CLI — query SEC filings and insider data from the terminal"
  homepage "https://github.com/MarounAntoun/finradar-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/MarounAntoun/finradar-cli/releases/download/cli-v#{version}/finradar-macos"
    sha256 "d77a6a129445643c41dd374f6b4fd6ca0cf70e4391b7b59106ee12576b153f16"
  end

  on_linux do
    url "https://github.com/MarounAntoun/finradar-cli/releases/download/cli-v#{version}/finradar-linux"
    sha256 "d1cf9d769e4403a1000163fc343992e6f037c2493a90cd8287a887d5d01bb18a"
  end

  def install
    bin.install Dir["finradar-*"].first => "finradar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/finradar --version")
  end
end
