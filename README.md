# Lichess Android App

A native Android WebView wrapper for **https://lichess.org** — the free, open-source chess server.

## Features
- Full lichess.org experience in a native app
- Dark theme matching lichess UI (#262421 background, green accent)
- Pull-to-refresh
- Hardware back-button navigation
- Board sounds enabled (media playback allowed)
- HTTPS-only

## Build (GitHub Actions)
Every push to `main` triggers the workflow which produces:
- `app-debug.apk` — install directly for testing
- `app-release-unsigned.apk` — sign manually before distributing
