# typed: false
# frozen_string_literal: true

# Auto-patched by the finradar-cli release CI (cli-release.yml) on every cli-v* tag:
# the `version` line and both sha256 values are replaced with the released artifacts.
# Keep column-0 indentation so `brew audit --strict` passes.
class Finradar < Formula
  desc "FinRadar CLI — query SEC filings and insider data from the terminal"
  homepage "https://github.com/MarounAntoun/finradar-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/MarounAntoun/finradar-cli/releases/download/cli-v#{version}/finradar-macos"
    sha256 "c278432d075951a063a6ff2058940d9c43c0327af8707fc3bd9a73f549286c47"
  end

  on_linux do
    url "https://github.com/MarounAntoun/finradar-cli/releases/download/cli-v#{version}/finradar-linux"
    sha256 "e0560eccfd83e749dc29c6698f0064356b30d014e58995e48073fb436ac4e820"
  end

  def install
    bin.install Dir["finradar-*"].first => "finradar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/finradar --version")
  end
end
