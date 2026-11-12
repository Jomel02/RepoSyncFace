# Vendored build downloads

`WindowsBuilder.py` uses a file from this folder (matched by file name) before
downloading it from its URL. The binaries are not committed to git (ffmpeg is
larger than GitHub's 100 MB limit), so keep a backup of this folder.

| File | Source URL | SHA-256 |
|---|---|---|
| python-3.8.10-embed-amd64.zip | https://www.python.org/ftp/python/3.8.10/python-3.8.10-embed-amd64.zip | abbe314e9b41603dde0a823b76f5bbbe17b3de3e5ac4ef06b759da5466711271 |
| get-pip.py | https://bootstrap.pypa.io/pip/3.8/get-pip.py | c356238f08811001604eb13faa7248bbcd86ee00762468d8e10a1f367eadc906 |
| 7za.zip | https://github.com/iperov/DeepFaceLive/releases/download/7za/7za.zip | 8213708a850caf3193aebee267a90c596419a3d72998af16d23428ca09e93ed5 |
| msvc.zip | https://github.com/iperov/DeepFaceLive/releases/download/msvc/msvc.zip | 6ef15a157809cb025bac1cf5172501c80d9e0e8cbf9db861ce1253b625afe9cf |
| ffmpeg-4.4-full_build.zip | https://github.com/GyanD/codexffmpeg/releases/download/4.4/ffmpeg-4.4-full_build.zip | bdb7972b4e15846db574c856536a0d059d5c68ce362287c11072caee48c35277 |

Downloaded 2026-11-12. pip packages (including torch) are not vendored; they
come from PyPI / download.pytorch.org and are cached in `<cache-dir>/_pip_cache`.
