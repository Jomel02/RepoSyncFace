# SynchFace

SynchFace is a real-time face swap desktop app for Windows. It is a modified
version of **[DeepFaceLive](https://github.com/iperov/DeepFaceLive) by iperov**.
All credit for the original application, models and research goes to the
DeepFaceLive project. The upstream repository is archived.

- **License:** GNU GPL v3 (see [LICENSE](LICENSE)). The software comes with
  ABSOLUTELY NO WARRANTY.
- **Source code:** https://github.com/Jomel02/DeepFaceLive
- **What changed from DeepFaceLive:** see [NOTICE.md](NOTICE.md).
- **Bundled models and libraries:** see
  [THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md). Some bundled models are
  licensed for non-commercial research only.

## Building on Windows

Use any Python 3 to run the builder. It downloads its own embedded Python 3.8
and all dependencies into the output folder:

```
python build\windows\WindowsBuilder.py --build-type dfl-windows --release-dir ..\Builds\SynchFace_DirectX12 --cache-dir ..\_cache --backend directml
python build\windows\WindowsBuilder.py --build-type dfl-windows --release-dir ..\Builds\SynchFace_NVIDIA --cache-dir ..\_cache --backend cuda
```

Use `--backend cuda` for NVIDIA GPUs and `--backend directml` for other
DirectX 12 GPUs. Start the app with `SynchFace.bat` in the output folder.

### Installers (reproduce `SynchFace_<backend>_Setup.exe` from scratch)

1. Install the tools once (any Windows 10/11 PC; about 20 GB free disk space):

   ```
   winget install --id Git.Git -e
   winget install --id Python.Python.3.11 -e
   winget install --id JRSoftware.InnoSetup -e --scope user
   ```

2. Get the source code:

   ```
   git clone https://github.com/Jomel02/DeepFaceLive.git C:\SF\SynchFace
   ```

3. Optional: copy your backup of `build\windows\_vendor` (Python, get-pip,
   7-Zip, MSVC DLLs, ffmpeg) into the clone. Without it the builder downloads
   the same files from the URLs listed in `build\windows\_vendor\README.md`.

4. Build the release folders. `--release` leaves out the non-commercial
   InsightFace models, the celebrity model list, the sample videos and the
   developer tools. Keep the output folders outside the repo and use short,
   full paths:

   ```
   cd C:\SF\SynchFace
   python build\windows\WindowsBuilder.py --build-type dfl-windows --release-dir C:\SF\Builds\SynchFace_DirectX12_Release --cache-dir C:\SF\_cache --backend directml --release
   python build\windows\WindowsBuilder.py --build-type dfl-windows --release-dir C:\SF\Builds\SynchFace_NVIDIA_Release --cache-dir C:\SF\_cache --backend cuda --release
   ```

5. Build the installers with Inno Setup. Pass `SourceDir` as a full path
   without `..`, because some files are nested deeply and Windows limits
   paths to 260 characters:

   ```
   cd C:\SF\SynchFace\build\windows
   "%LOCALAPPDATA%\Programs\Inno Setup 6\ISCC.exe" /DBackend=DirectX12 /DSourceDir="C:\SF\Builds\SynchFace_DirectX12_Release" /DOutputDir="C:\SF\Installers" installer.iss
   "%LOCALAPPDATA%\Programs\Inno Setup 6\ISCC.exe" /DBackend=NVIDIA /DSourceDir="C:\SF\Builds\SynchFace_NVIDIA_Release" /DOutputDir="C:\SF\Installers" installer.iss
   ```

   These commands are for Command Prompt. In PowerShell, put `&` before the
   quoted `ISCC.exe` path.

6. Test the result with `build\windows\TEST_CHECKLIST.md`.

---

## Original DeepFaceLive README

The text below is the original DeepFaceLive README, kept for reference and
credit. Links, model lists and support/donation information there refer to
the original project, not to SynchFace.

<table align="center" border="0">

<tr><td colspan=2 align="center">

![](doc/deepfacelive_intro.png)

![](doc/logo_onnx.png)![](doc/logo_directx.png)![](doc/logo_python.png)

</td></tr>
</table>
<table align="center" border="0">

<tr><td colspan=2 align="center">

## Face Swap (DFM)

You can swap your face from a webcam or the face in the video using trained face models.

Here is a list of available ready-to-use public face models.

These persons do not exists. Similarities with real people are accidental. Except Keanu Reeves. He exists, and he's breathtaking!
</td></tr>

<tr><td colspan=2 align="center">

<table align="center" border="0">
<tr><td align="center">
Keanu Reeves

<img src="doc/celebs/Keanu_Reeves/Keanu_Reeves.png" width=128></img>

<a href="doc/celebs/Keanu_Reeves/examples.md">examples</a>
</td><td align="center">
Irina Arty

<img src="doc/celebs/Irina_Arty/Irina_Arty.png" width=128></img>

examples
</td><td align="center">
Millie Park

<img src="doc/celebs/Millie_Park/Millie_Park.png" width=128></img>

examples
</td><td align="center">
Rob Doe

<img src="doc/celebs/Rob_Doe/Rob_Doe.png" width=128></img>

<a href="doc/celebs/Rob_Doe/examples.md">examples</a>
</td><td align="center">
Jesse Stat

<img src="doc/celebs/Jesse_Stat/Jesse_Stat.png" width=128></img>

examples
</td></tr>

</table>

<table align="center" border="0">
<tr><td align="center">
Bryan Greynolds

<img src="doc/celebs/Bryan_Greynolds/Bryan_Greynolds.png" width=128></img>

<a href="doc/celebs/Bryan_Greynolds/examples.md">examples</a>
</td><td align="center">
Mr. Bean

<img src="doc/celebs/Mr_Bean/Mr_Bean.png" width=128></img>

examples
</td><td align="center">
Ewon Spice

<img src="doc/celebs/Ewon_Spice/Ewon_Spice.png" width=128></img>

<a href="doc/celebs/Ewon_Spice/examples.md">examples</a>

</td><td align="center">
Natasha Former

<img src="doc/celebs/Natasha_Former/Natasha_Former.png" width=128></img>

<a href="doc/celebs/Natasha_Former/examples.md">examples</a>

</td><td align="center">
Emily Winston

<img src="doc/celebs/Emily_Winston/Emily_Winston.png" width=128></img>

<a href="doc/celebs/Emily_Winston/examples.md">examples</a>

</td></tr></table>
<table align="center" border="0">
<tr><td align="center">
Ava de Addario

<img src="doc/celebs/Ava_de_Addario/Ava_de_Addario.png" width=128></img>

<a href="doc/celebs/Ava_de_Addario/examples.md">examples</a>
</td><td align="center">
Dilraba Dilmurat

<img src="doc/celebs/Dilraba_Dilmurat/Dilraba_Dilmurat.png" width=128></img>

examples
</td><td align="center">
Matilda Bobbie

<img src="doc/celebs/Matilda_Bobbie/Matilda_Bobbie.png" width=128></img>

<a href="doc/celebs/Matilda_Bobbie/examples.md">examples</a>
</td><td align="center">
Yohanna Coralson

<img src="doc/celebs/Yohanna_Coralson/Yohanna_Coralson.png" width=128></img>

<a href="doc/celebs/Yohanna_Coralson/examples.md">examples</a>

</td><td align="center">
Amber Song

<img src="doc/celebs/Amber_Song/Amber_Song.png" width=128></img>

examples

</td></tr></table>
<table align="center" border="0">
<tr align="center"><td align="center">
Kim Jarrey

<img src="doc/celebs/Kim_Jarrey/Kim_Jarrey.png" width=128></img>

<a href="doc/celebs/Kim_Jarrey/examples.md">examples</a>
</td><td align="center">
David Kovalniy

<img src="doc/celebs/David_Kovalniy/David_Kovalniy.png" width=128></img>

<a href="doc/celebs/David_Kovalniy/examples.md">examples</a>
</td><td align="center">
Jackie Chan

<img src="doc/celebs/Jackie_Chan/Jackie_Chan.png" width=128></img>

examples
</td><td align="center">
Nicola Badge

<img src="doc/celebs/Nicola_Badge/Nicola_Badge.png" width=128></img>

<a href="doc/celebs/Nicola_Badge/examples.md">examples</a>
</td><td align="center">
Joker

<img src="doc/celebs/Joker/Joker.png" width=128></img>

examples
</td></tr></table>
<table align="center" border="0">
<tr align="center"><td>
Dean Wiesel

<img src="doc/celebs/Dean_Wiesel/Dean_Wiesel.png" width=128></img>

<a href="doc/celebs/Dean_Wiesel/examples.md">examples</a>
</td><td align="center">
Silwan Stillwone

<img src="doc/celebs/Silwan_Stillwone/Silwan_Stillwone.png" width=128></img>

<a href="doc/celebs/Silwan_Stillwone/examples.md">examples</a>
</td><td align="center">
Tim Chrys

<img src="doc/celebs/Tim_Chrys/Tim_Chrys.png" width=128></img>

<a href="doc/celebs/Tim_Chrys/examples.md">examples</a>

</td><td align="center">
Zahar Lupin

<img src="doc/celebs/Zahar_Lupin/Zahar_Lupin.png" width=128></img>

<a href="doc/celebs/Zahar_Lupin/examples.md">examples</a>
</td><td align="center">
Tim Norland

<img src="doc/celebs/Tim_Norland/Tim_Norland.png" width=128></img>

<a href="doc/celebs/Tim_Norland/examples.md">examples</a>
</td></tr></table>


<table align="center" border="0">
<tr align="center"><td>
Natalie Fatman

<img src="doc/celebs/Natalie_Fatman/Natalie_Fatman.png" width=128></img>

<a href="doc/celebs/Natalie_Fatman/examples.md">examples</a>
</td><td align="center">
Liu Lice

<img src="doc/celebs/Liu_Lice/Liu_Lice.png" width=128></img>

<a href="doc/celebs/Liu_Lice/examples.md">examples</a>
</td><td align="center">
Albica Johns

<img src="doc/celebs/Albica_Johns/Albica_Johns.png" width=128></img>

<a href="doc/celebs/Albica_Johns/examples.md">examples</a>

</td><td align="center">
Meggie Merkel

<img src="doc/celebs/Meggie_Merkel/Meggie_Merkel.png" width=128></img>

<a href="doc/celebs/Meggie_Merkel/examples.md">examples</a>
</td><td align="center">
Tina Shift

<img src="doc/celebs/Tina_Shift/Tina_Shift.png" width=128></img>

<a href="doc/celebs/Tina_Shift/examples.md">examples</a>
</td></tr></table>

</td></tr>

<tr><td colspan=2 align="center">
If you want a higher quality or better face match, you can train your own face model using <a href="https://github.com/iperov/DeepFaceLab">DeepFaceLab</a>

Here is an <a href="https://www.tiktok.com/@arnoldschwarzneggar/video/6995538782204300545">example</a> of Arnold Schwarzneggar trained on a particular face and used in a video call. Read the FAQ for more information.

</td></tr>

</table>
<table align="center" border="0">

<tr><td colspan=2 align="center">

## Face Swap (Insight)

You can swap your face from a webcam or the face in the video using your own single photo.

<img src="doc/lukashenko.png" width=128></img>

<img src="doc/insight_faceswap_example.gif"></img>

</td></tr>

</table>
<table align="center" border="0">

<tr><td colspan=2 align="center">

## Face Animator

There is also a Face Animator module in DeepFaceLive app. You can control a static face picture using video or your own face from the camera. The quality is not the best, and requires fine face matching and tuning parameters for every face pair, but enough for funny videos and memes or real-time streaming at 25 fps using 35 TFLOPS GPU.

<img src="doc/face_animator_example.gif"></img>

[![Stranger Things theme intro acapella](doc/Ng1C78Ceyxg_screenshot.png)](https://www.youtube.com/watch?v=Ng1C78Ceyxg)

Here is a [mini video](doc/FaceAnimator_tutor.webm?raw=true) showing the process of setting up the Face Animator for Obama controlling Kim Chen's face.

</td></tr>

</table>

<table align="center" border="0">

<tr><td colspan=2 align="center">

## System requirements

any DirectX12 compatible graphics card

(Recommended RTX 2070+ / Radeon RX 5700 XT+ )

Modern CPU with AVX instructions

4GB RAM, 32GB+ paging file

Windows 10

</td></tr>
<tr><td colspan=2 align="center">

## Documentation

</td></tr>
<tr><td align="right">
Windows
</td><td align="left">

<a href="doc/windows/main_setup.md">Main setup</a>

- <a href="doc/windows/for_streaming.md">additional setup for streaming</a>

- <a href="doc/windows/for_video_calls.md">additional setup for video calls</a>       

<a href="doc/windows/using_android_phone_camera.md">Using Android phone camera</a>  

</td></tr>
<tr><td align="right">
Linux
</td><td align="left">
<a href="build/linux">Build info</a>
</td></tr>
<tr><td align="right">
Frequently asked questions
</td><td align="left">
<a href="doc/user_faq/user_faq.md">for User</a>

<a href="doc/developer_faq/developer_faq.md">for Developer</a>
</td></tr>
<tr><td colspan=2 align="center">

## Releases

</td></tr>
<tr><td align="right">

<a href="https://disk.yandex.ru/d/7i5XTKIKVg5UUg">Windows 10 x64 (yandex.ru)</a>

<a href="https://mega.nz/folder/m10iELBK#Y0H6BflF9C4k_clYofC7yA">Windows 10 x64 (mega.nz)</a>


</td><td align="left">
Contains stand-alone zero-dependency all-in-one ready-to-use portable self-extracting folder! You don't need to install anything other than video drivers.
<br><br>
DirectX12 build : NVIDIA, AMD, Intel videocards.
<br><br>
NVIDIA build : NVIDIA cards only, GT730 and higher. Works faster than DX12. FaceMerger can work also on AMD/Intel.
</td></tr>
<tr><td colspan=2 align="center">

## Communication groups

<tr><td align="right">
<a href="https://discord.gg/rxa7h9M6rH">Discord</a>
</td><td align="left">Official discord channel. English / Russian.</td></tr>

<tr><td align="right">
QQ群124500433
</td><td align="left">中文交流QQ群，商务合作找群主</td></tr>

</td></tr>
<tr><td colspan=2 align="center">

## How can I help the project?

</td></tr>
<tr><td colspan=2 align="center">
Train your own face model by following the recommendations in the FAQ section and share it on Discord. If the model fits the quality, it will be added to the public library.
</td></tr>
<tr><td colspan=2 align="center">
Register github account and push "Star" button.
</td></tr>
<!--<tr><td colspan=2 align="center">
<a href="https://www.paypal.com/paypalme/DeepFaceLab">Donate via Paypal</a>
</td></tr>-->
<tr><td colspan=2 align="center">
<a href="https://yoomoney.ru/to/41001142318065">Donate via Yoomoney</a>
</td></tr>
<tr><td colspan=2 align="center">
bitcoin:bc1qewl062v70rszulml3f0mjdjrys8uxdydw3v6rq
</td></tr>
<tr><td colspan=2 align="center">


<!--
    <a href="https://br-stone.online"><img src="doc/logo_barclay_stone.png"></img></a><a href="https://exmo.com"><img src="doc/logo_exmo.png"></img></a>

    presents

    <tr><td align="right">


    <a href="">Windows (magnet link)</a>
    </td><td align="center">Latest release. Use torrent client to download.</td></tr>
    </tr>
-->

</table>



