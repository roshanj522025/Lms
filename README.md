# Kristu Jayanti LMS – Android App

A native Android WebView wrapper for **https://www.kristujayantiexamlms.com**,
built automatically via GitHub Actions.

---

## Features
- Loads the LMS website in a full-screen WebView
- Splash screen on launch
- Pull-to-refresh
- Hardware back-button navigation
- Progress bar while pages load
- HTTPS-only (network security config)

---

## GitHub Actions – Automated Build

Every push to `main` / `master` triggers:
1. **Debug APK** – built unconditionally, uploaded as workflow artifact.
2. **Release APK** – signed with your keystore, uploaded as artifact **and** attached to a GitHub Release.

### Required Repository Secrets

Go to **Settings → Secrets and variables → Actions → New repository secret** and add:

| Secret name        | Value                                          |
|--------------------|------------------------------------------------|
| `KEYSTORE_BASE64`  | Base64-encoded `.jks` keystore file            |
| `KEYSTORE_PASSWORD`| Keystore password                              |
| `KEY_ALIAS`        | Key alias inside the keystore                  |
| `KEY_PASSWORD`     | Key password                                   |

#### Generating a keystore (first time only)
```bash
keytool -genkey -v \
  -keystore kristujayanti.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias kristujayanti \
  -dname "CN=KristuJayanti, OU=LMS, O=KristuJayanti, L=Bangalore, S=Karnataka, C=IN"

# Base64-encode it for the secret
base64 -i kristujayanti.jks | pbcopy   # macOS
base64 kristujayanti.jks               # Linux – copy the output
```

---

## Local Build

```bash
# Debug
./gradlew assembleDebug

# Release (export env vars first)
export KEYSTORE_PATH=path/to/kristujayanti.jks
export KEYSTORE_PASSWORD=yourpassword
export KEY_ALIAS=kristujayanti
export KEY_PASSWORD=yourkeypassword
./gradlew assembleRelease
```

Output APKs are at `app/build/outputs/apk/`.
