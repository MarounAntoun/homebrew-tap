# typed: false
# frozen_string_literal: true

# Release CI (cli-release.yml, publish-managers job) auto-patches version +
# sha256 on every cli-v* tag push. Keep col-0 indentation so `brew audit
# --strict` passes after the patch.
class Finradar < Formula
  desc "FinRadar CLI — query SEC filings and insider data from the terminal"
  homepage "https://github.com/MarounAntoun/finradar-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/MarounAntoun/finradar-cli/releases/download/cli-v#{version}/finradar-macos"
    sha256 "REPLACE_AT_RELEASE"
  end

  on_linux do
    url "https://github.com/MarounAntoun/finradar-cli/releases/download/cli-v#{version}/finradar-linux"
    sha256 "REPLACE_AT_RELEASE"
  end

  def install
    bin.install Dir["finradar-*"].first => "finradar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/finradar --version")
  end
end
