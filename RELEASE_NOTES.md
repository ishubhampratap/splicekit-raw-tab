# RAW Tab v2.0.0

## New
- RED (.R3D) support: Final Cut's RED RAW controls (Color Space, Gamma, ISO, Kelvin, Tint, FLUT, Shadow, DRX, Saturation, Contrast, Brightness, Exposure) in the RAW tab. Requires RED Apple Workflow Installer; click **Load RED RAW Controls** once per session.
- ProRes RAW now shows Final Cut's ProRes RAW settings. Before, it showed the wrong window.
- Formats are detected automatically and the controls switch when you select a clip of a different RAW format.
- Selecting clips of different RAW formats shows a message instead of controls.
- Clear messages when a format's settings aren't available, instead of controls that don't work.
- New formats can be added with one line (`kProviders` in `RawTab.m`).

## Fixed
- RAW controls are no longer stretched to the full Inspector height. They keep their own layout at the top of the tab.
- Less flicker: the controls are only reloaded when the selection changes.

## Unchanged
- BRAW and other RAW-processor formats work as before.
- Final Cut's own Inspector tabs are never displaced.

## Good to know
- ProRes RAW ISO, Exposure Bias and Color Temperature only appear when the clip's metadata supports them, the same as in Final Cut's own window.

## Install
Download `raw-tab-v2.0.0.zip` below, unzip it, run `bash install.sh`, then restart Final Cut Pro (SpliceKit build).
