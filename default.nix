{ stdenv
, lib
, dpkg
, fetchurl
, autoPatchelfHook
, glib-networking
, webkitgtk
, wrapGAppsHook
}:

stdenv.mkDerivation rec {
  pname = "tauri-nativify";
  version = "0.0.1";

  src = fetchurl {
    url = "https://github.com/Bwc9876/tauri-nativify/releases/download/gui_v${version}r/tauri-nativify_${version}_amd64.deb";
    hash = "sha256-61SSEky8WuMk+YtOHJIaCMvpxIdDXB0EU1GF2rrX11k=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    dpkg
  ];

  buildInputs = [
    glib-networking
    webkitgtk
    wrapGAppsHook
  ];

  unpackCmd = "dpkg-deb -x $curSrc source";

  installPhase = "mv usr $out";
  meta = with lib; {
    description = "Silly app blehhhhh";
    homepage = "https://github.com/Bwc9876/tauri-nativify";
    mainProgram = "tauri-nativify";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    platforms = platforms.linux;
    license = licenses.gpl3;
    maintainers = with maintainers; [ bwc9876 ];
  };
}