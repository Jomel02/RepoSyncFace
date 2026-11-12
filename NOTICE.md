# NOTICE

SynchFace is a modified version of **DeepFaceLive** by iperov
(https://github.com/iperov/DeepFaceLive), which is licensed under the
GNU General Public License v3. SynchFace is distributed under the same
license; see [LICENSE](LICENSE). The original copyright and license notices
are kept unchanged.

Source code for SynchFace: https://github.com/Jomel02/DeepFaceLive

## Modifications

Modified by the SynchFace maintainer, starting 2026-11-12:

- **Windows build:** `build/windows/WindowsBuilder.py` was fixed so it works
  again with today's download servers. It uses the Python 3.8 `get-pip.py`,
  pins `pyqt6-qt6==6.5.1`, uses local copies from `build/windows/_vendor`,
  quotes paths that contain spaces, and replaces (instead of updating) an
  existing self-extracting archive.
- **Rebrand:** the user-visible name is now SynchFace. This covers the
  window title, the `run SynchFace` command (`run DeepFaceLive` still works),
  the stream output window title, the app icon and splash image, the build
  output names, and the Help menu link, which points to the fork. Unused
  sponsor logos were removed. Internal package and class names are unchanged.
- **About dialog:** Help > About was added. It shows the origin, the license,
  the no-warranty notice and where to get the source code.
- **Release builds:** `WindowsBuilder.py --release` leaves out the InsightFace
  models (non-commercial research only), the predefined celebrity model list,
  the sample videos and animatables, `doc/celebs`, `__dev_archived`,
  VS Code and the developer scripts. The app hides the InsightFace options
  when those models are missing.
- **Installer:** an Inno Setup script (`build/windows/installer.iss`) and an
  icon (`build/windows/app_icon.ico`) were added. They package a release build
  into `SynchFace_<backend>_Setup.exe`.
- **Documentation:** this NOTICE, `THIRD_PARTY_LICENSES.md`, and a SynchFace
  section at the top of `README.md` were added.
