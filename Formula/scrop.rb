class Scrop < Formula
  include Language::Python::Virtualenv

  desc "Crop sub-images (photos, sticky notes, receipts) out of a scanned composite image"
  homepage "https://github.com/dfla-me/scrop"
  url "https://github.com/dfla-me/scrop/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "78efbc743aa19701dda54b37db916dcd71b1a872be2b38ef7cbd71a3639f8074"
  license "MIT"

  depends_on "python@3.14"

  def install
    venv = virtualenv_create(libexec, "python3.14")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "usage: scrop", shell_output("#{bin}/scrop --help")
  end
end
