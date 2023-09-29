# tauri-nativify

A silly app that opens a URL in the system webview using tauri.

Did I need to use tauri for this? who knows!

## Setup

`cargo tauri build -b none` to get the binary.

Then create a .desktop file pointing to the binary passing the first argument as the URL to open. Optionally you can pass the second argument as the name of the app.

Example desktop file:

```toml
[Desktop Entry]
Name=Google Messages
Comment=Send and receive messages from your Android Phone
Exec=/path/to/tauri-nativify "https://messages.google.com/web/conversations" Messages
Terminal=false
Type=Application
Icon=org.kde.neochat
```
