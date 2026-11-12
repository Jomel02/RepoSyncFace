# Third-party components and licenses

SynchFace itself is GPL v3 (see [LICENSE](LICENSE)). The Windows build bundles
the components below. **UNVERIFIED** means the license, the right to
redistribute, or where the file came from could not be confirmed. Please
check these before distributing.

Last checked: 2026-11-12.

## Neural network models (in `modelhub/`)

| Model | Files | Likely source | License | Status |
|---|---|---|---|---|
| InsightFace swap | `onnx/InsightFaceSwap/inswapper_128.onnx`, `w600k_r50.onnx` | InsightFace (deepinsight/insightface) | **Non-commercial research only** (InsightFace README: code is MIT, but all models and training data are non-commercial research only) | Confirmed. Left out of `--release` builds. |
| InsightFace 2D 106 landmarks | `onnx/InsightFace2d106/InsightFace2D106.onnx` | InsightFace | **Non-commercial research only** | Confirmed. Left out of `--release` builds. |
| CenterFace | `onnx/CenterFace/CenterFace.onnx`, `torch/CenterFace/CenterFace.pth` | Star-Clouds/CenterFace | MIT (repository license) | **UNVERIFIED** provenance. The code does not cite a source. |
| YoloV5Face | `onnx/YoloV5Face/YoloV5Face.onnx` | deepcam-cn/yolov5-face | GPL-3.0 (repository license) | **UNVERIFIED** provenance |
| FaceMesh | `onnx/FaceMesh/FaceMesh.onnx` | Google MediaPipe Face Mesh | Apache-2.0 (repository license) | **UNVERIFIED** provenance |
| S3FD | `onnx/S3FD/S3FD.onnx`, `torch/S3FD/S3FD.pth` | Unknown | Unknown | **UNVERIFIED** |
| LIA (Face Animator) | `onnx/LIA/generator.onnx` | wyhsirius/LIA (cited in `LIA.py`) | GitHub cannot identify the repository license | **UNVERIFIED** |
| LBF face marker | `cv/FaceMarkerLBF/lbfmodel.yaml` | OpenCV facemark LBF model (kurnianggoro/GSOC2017) | Unknown | **UNVERIFIED** |
| Prebuilt celebrity DFM models | Downloaded at runtime from iperov's GitHub releases (`modelhub/DFLive/DFMModel.py`) | iperov | Not stated | **UNVERIFIED**. Hidden in `--release` builds. |

## Sample media

| Item | License | Status |
|---|---|---|
| `build/samples/*.mp4`, `build/animatables/*` | None stated. They show real people and movie clips. | **UNVERIFIED**. Left out of `--release` builds. |
| `doc/celebs/*` | None stated | **UNVERIFIED**. Not shipped in `--release` builds. |

## Fonts (in `resources/fonts/`)

| Font | License | Status |
|---|---|---|
| Noto Sans, Noto Mono, Noto Sans SC | SIL Open Font License 1.1 | Confirmed (Google Noto fonts) |
| Tahoma (`tahoma.ttf`, `tahomabd.ttf`) | Microsoft proprietary font | **UNVERIFIED**. Probably **not** licensed for redistribution. |
| Digital-7 Mono | Style-7 font. Its terms are commonly given as free for personal use. | **UNVERIFIED** |

## Python runtime and packages (DirectX12 build)

| Component | Version | License (from package metadata) |
|---|---|---|
| CPython (embeddable) | 3.8.10 | PSF License |
| PyQt6 | 6.5.1 | GPL v3 |
| PyQt6-Qt6 (Qt runtime) | 6.5.1 | LGPL v3 |
| PyQt6-sip | 13.8.0 | SIP license (BSD-style) |
| numpy | 1.21.6 | BSD |
| opencv-python, opencv-contrib-python | 4.8.0.74 | Apache 2.0 |
| onnx | 1.14.0 | Apache 2.0 |
| onnxruntime-directml | 1.15.1 | MIT |
| protobuf | 5.29.6 | BSD-3-Clause |
| h5py | 3.11.0 | BSD-3-Clause |
| numexpr | 2.8.6 | MIT |
| flatbuffers | 25.12.19 | Apache 2.0 |
| coloredlogs | 15.0.1 | MIT |
| humanfriendly | 10.0 | MIT |
| mpmath | 1.3.0 | BSD |
| sympy | 1.13.3 | BSD |
| packaging | 26.2 | Apache-2.0 OR BSD-2-Clause |
| pyreadline3 | 3.5.6 | BSD |
| typing_extensions | 4.13.2 | PSF-2.0 |
| pip / setuptools / wheel | 25.0.1 / 75.3.4 / 0.45.1 | MIT |

### Additional packages in the NVIDIA (CUDA) build

Taken from the package metadata of the finished CUDA release build.

| Component | Version | License |
|---|---|---|
| torch | 1.13.1+cu117 | BSD-3-Clause |
| torchvision | 0.14.1+cu117 | BSD |
| onnxruntime-gpu | 1.15.1 | MIT |
| Pillow | 10.4.0 | HPND |
| requests | 2.32.4 | Apache-2.0 |
| urllib3 | 2.2.3 | MIT |
| idna | 3.15 | BSD-3-Clause |
| charset-normalizer | 3.5.2 | MIT |
| certifi | 2026.10.23 | MPL-2.0 |
| NVIDIA CUDA 11.7 runtime, cuBLAS, cuDNN 8, cuFFT, cuRAND, cuSOLVER, cuSPARSE, CUPTI and NVRTC DLLs (19 files, about 2.3 GB, taken from the torch wheel into `_internal/CUDA/bin`) | 11.7 / 8 | NVIDIA license agreements: **UNVERIFIED** redistribution terms |
| `zlibwapi.dll` (copied from the torch wheel into `_internal/CUDA/bin`) | | zlib license (usual for zlib builds): **UNVERIFIED** for this binary |

## Other bundled binaries

| Component | Source | License | Status |
|---|---|---|---|
| FFmpeg 4.4 (`ffmpeg.exe`, `ffprobe.exe`) | gyan.dev full build | GPL v3 (`ffmpeg -L`, built with `--enable-gpl --enable-version3`) | Confirmed |
| Microsoft Visual C++ runtime DLLs (`msvc.zip`: msvcp100–140, msvcr100–120, vcruntime140_1) | iperov's `msvc.zip` release | Microsoft Visual C++ Redistributable terms | **UNVERIFIED**. The source and versions of the zip are not documented. |
| `msvcp60.dll`, `msvcp110_win.dll` (also in `msvc.zip`) | iperov's `msvc.zip` release | Windows system components, not part of the VC++ Redistributable | **UNVERIFIED**. Probably **not** licensed for redistribution. |
| 7-Zip (`7za.exe`, `7z.sfx`) | iperov's `7za.zip` release | GNU LGPL 2.1 | Only used at build time. The `7z.sfx` stub ends up inside the self-extracting archive, but not inside the installer. |
| Visual Studio Code (portable) | code.visualstudio.com | Microsoft Software License | Developer builds only. Left out of `--release` builds. |
