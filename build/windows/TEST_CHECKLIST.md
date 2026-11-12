# SynchFace installer: manual test checklist (clean Windows PC)

Use this on a Windows 10/11 64-bit PC **without Python**. The PC should either
have never had DeepFaceLive/SynchFace installed, or have had it removed first.
Tick each box. Write down anything unexpected, with a screenshot.

## 0. Before you start

- [ ] Pick the right installer for the PC's GPU:
  - NVIDIA GPU: `SynchFace_NVIDIA_Setup.exe` (1.7 GB download, about 5.5 GB installed).
  - Any other DirectX 12 GPU (AMD, Intel): `SynchFace_DirectX12_Setup.exe` (470 MB download, about 1.2 GB installed).
- [ ] Update the GPU driver. For NVIDIA, use driver 516 or newer, which CUDA 11.7 needs.
- [ ] Confirm Python is not installed. In a Command Prompt, `where python` should print
      "Could not find files" or only point to the Microsoft Store stub.
- [ ] Have these ready:
  - a webcam;
  - a short `.mp4` video that shows a face;
  - one `.dfm` face model (for example `Zahar_Lupin.dfm` from the original DeepFaceLive releases).

## 1. Install

- [ ] Double-click the setup file. If Windows shows **"Windows protected your PC"**
      (the installer is not code-signed), click **More info → Run anyway**.
- [ ] No administrator (UAC) prompt appears. The install is per-user.
- [ ] The **License Agreement** page shows the GNU GPL v3 text. Setup can't continue until you choose "I accept".
- [ ] The default folder is `C:\Users\<name>\AppData\Local\Programs\SynchFace`.
- [ ] Tick **Create a desktop shortcut**. Finish the install. NVIDIA takes several minutes.
- [ ] A **SynchFace** entry is in the Start Menu, and the desktop shortcut exists. Both show the SynchFace icon.
- [ ] **Settings → Apps** lists "SynchFace (NVIDIA)" or "SynchFace (DirectX12)".

## 2. Launch

- [ ] Start SynchFace from the Start Menu. A console window opens; this is expected.
- [ ] The SynchFace splash image appears, then the main window titled **SynchFace**.
- [ ] The taskbar shows the SynchFace icon.
- [ ] Release build check: there is **no "Face swap (Insight)"** panel.
- [ ] Release build check: **Face marker** offers only OpenCV LBF and Google FaceMesh.
- [ ] The console shows no red "Traceback" or "Error" lines.

## 3. Camera source

- [ ] In **Camera source**, turn the module on, pick **Device index** 0 (or your webcam), and pick a **Resolution**.
- [ ] The left preview shows the live camera image.
- [ ] **Face detector** draws a box around your face, and **Face aligner** shows your aligned face in its preview.
- [ ] Change **Rotation** and **Flip horizontal**. The image changes accordingly.

## 4. File source

- [ ] Turn **Camera source** off and **File source** on.
- [ ] Open your `.mp4` file with the file selector. `userdata\samples` is empty in release builds, so browse to the file.
- [ ] The video plays in the preview, and the face is detected.
- [ ] Toggle **Real time** and **Auto rewind**. Playback behaves as labelled.

## 5. Face swap with a .dfm model

- [ ] Close SynchFace. Copy your `.dfm` into `...\SynchFace\userdata\dfm_models\`. Start SynchFace again.
- [ ] In **Face swap (DFM)**, choose the **Device**:
  - NVIDIA build: an NVIDIA "CUDA" device.
  - DirectX12 build: a "DirectML" device.
- [ ] The **Model** list shows **only your model**, with no celebrity models. Select it.
- [ ] After the model loads (a few seconds), the swapped face appears in the right-hand previews.
- [ ] Change **Morph factor** and, in **Face merger**, **Face opacity**. The result changes.
- [ ] Note the speed shown as **Average FPS** in **Stream output**.

## 6. Stream output window

- [ ] In **Stream output**, set **Source** to **Merged frame** and click the **window** button.
- [ ] A separate window titled **SynchFace output** opens and shows the swapped video.
- [ ] Click **window** again. The window closes.
- [ ] Optional: set **Save sequence** to a folder and check that images are written there.

## 7. Language switch

- [ ] **Language → Español** (or another language). The app restarts its panels in that language.
- [ ] **Help** now shows the translated "About" item.
- [ ] Switch back to **Language → English**.

## 8. About dialog

- [ ] **Help → About** shows:
  - "SynchFace";
  - "Based on DeepFaceLive by iperov" with https://github.com/iperov/DeepFaceLive;
  - "Licensed under the GNU General Public License v3";
  - the "ABSOLUTELY NO WARRANTY" line;
  - "Source code: https://github.com/Jomel02/DeepFaceLive".
- [ ] Both links open in the browser.
- [ ] **Help → Visit github page** opens https://github.com/Jomel02/DeepFaceLive.

## 9. Restart keeps settings

- [ ] Close SynchFace (**File → Quit**), then press a key in the console window to close it.
- [ ] Start SynchFace again. The camera/file choice, the model and the language are remembered.

## 10. Uninstall

- [ ] Close SynchFace.
- [ ] Uninstall it from **Settings → Apps → SynchFace → Uninstall** (or the Start Menu "Uninstall SynchFace").
- [ ] No administrator prompt appears, and the uninstall finishes without errors.
- [ ] The Start Menu entry and the desktop shortcut are gone.
- [ ] `...\Programs\SynchFace` now holds only `userdata` (your models and settings). This is intended.
      Delete that folder by hand to remove everything.
- [ ] Optional reinstall check: install again. Your model in `userdata\dfm_models` is still listed.

## Results

| Section | Pass / Fail | Notes |
|---|---|---|
| 1. Install | | |
| 2. Launch | | |
| 3. Camera source | | |
| 4. File source | | |
| 5. Face swap (.dfm) | | |
| 6. Stream output window | | |
| 7. Language switch | | |
| 8. About dialog | | |
| 9. Restart keeps settings | | |
| 10. Uninstall | | |

PC / GPU / driver tested: ______________________   Installer: NVIDIA / DirectX12   Date: __________
