# frozen_string_literal: true

class Hearout < Formula
  desc "Hang-proof runner for coding-agent CLIs, plus a small review panel"
  homepage "https://github.com/Aman-CERP/hearout"
  url "https://github.com/Aman-CERP/hearout/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3905314930c4af57bcfe10bfe5e7f32718a231cba584776ad10c771b4edef818"
  license "Apache-2.0"
  head "https://github.com/Aman-CERP/hearout.git", branch: "main"

  def install
    libexec.install "bin", "lib", "adapters", "share"
    (bin/"hearout").write <<~EOS
      #!/bin/bash
      export HEAROUT_HOME="#{libexec}"
      exec "#{libexec}/bin/hearout" "$@"
    EOS
    chmod 0755, bin/"hearout"
  end

  test do
    assert_match "hearout", shell_output("#{bin}/hearout version")
    assert_match "codex", shell_output("#{bin}/hearout adapters")
  end
end
