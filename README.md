# RAW Tab (SpliceKit plugin)

A SpliceKit plugin for Final Cut Pro that puts Final Cut's own RAW settings in their own tab in the Inspector, so you don't have to dig through the Info tab and a floating window.

## Supported formats

| Format | Controls shown | Notes |
|---|---|---|
| BRAW and other RAW-processor formats | Final Cut's RAW settings window | Same behavior as RAW Tab 1.x |
| ProRes RAW | Final Cut's ProRes RAW settings (Processing, ISO, Exposure Bias, Color Temperature, RAW to Log) | ISO / exposure / temperature only appear when the clip's metadata supports them, exactly as in Final Cut's own window |
| RED (.R3D) | Final Cut's RED RAW settings (Color Space, Gamma, ISO, Kelvin, Tint, FLUT, Shadow, DRX, Saturation, Contrast, Brightness, Exposure) | Needs RED Apple Workflow Installer. Click **Load RED RAW Controls** once per session |

- The tab appears only when every selected clip is RAW. It recognises the format automatically and shows the matching controls.
- Selecting clips of different RAW formats shows a message instead of controls.
- If a format's controls aren't available (for example RED without RED's plugin), the tab says so instead of showing non-working controls.
- It never displaces Final Cut's own Inspector tabs (Final Cut shows at most 5).

All controls are Final Cut's own, so changes, undo and saving behave exactly as in the native windows.

## Adding a format

Each format is one row in `kProviders` in `RawTab.m`: how to recognise it, and which of Final Cut's RAW settings windows edits it.

## Requirements

- Final Cut Pro with [SpliceKit](https://github.com/elliotttate/SpliceKit)
- Apple silicon Mac, macOS 14 or later
- For RED: [RED Apple Workflow Installer](https://www.reddigitalcinema.com/download/red-apple-workflow-installer)

## Install

```bash
bash install.sh
```

Then restart Final Cut Pro (the SpliceKit build). It builds from source if the Xcode Command Line Tools are installed, otherwise it installs the prebuilt `RawTab.dylib` from the release zip.

## Uninstall

Delete `~/Library/Application Support/SpliceKit/plugins/raw-tab/` and restart Final Cut Pro.

## Credits

Inspector tab plumbing modelled on [Transcript Tab](https://github.com/bcassin/fcp-transcript-tab) (MIT).

Log: `~/Library/Logs/SpliceKit/raw-tab.log`. Tested with Final Cut Pro 12.4 and SpliceKit 3.3.9.
