class Scrop < Formula
  include Language::Python::Virtualenv

  desc "Crop sub-images (photos, sticky notes, receipts) out of a scanned composite image"
  homepage "https://github.com/dfla-me/scrop"
  url "https://github.com/dfla-me/scrop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ac19bf45210efa5a92b177edf4d9d6e418bdb55edbdd512fe3f37ba2da3a9664"
  license "MIT"

  depends_on "numpy"
  depends_on "opencv"
  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3.13", system_site_packages: true)
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "usage: scrop", shell_output("#{bin}/scrop --help")
  end
end
