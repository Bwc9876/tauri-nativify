// Prevents additional console window on Windows in release, DO NOT REMOVE!!
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use tauri::Manager;

fn main() {
    let url = std::env::args()
        .nth(1)
        .expect("usage: tauri-nativify URL [TITLE]");

    let title = std::env::args().nth(2);

    tauri::Builder::default()
        .setup(move |app| {
            let windows = app.windows();
            let main_window = windows.get("main").unwrap();
            main_window
                .eval(&format!("window.location.replace(\"{}\")", url))
                .unwrap();
            if let Some(title) = title {
                main_window.set_title(&title).unwrap();
            }
            Ok(())
        })
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
