# App Icon Generation Scripts

This directory contains scripts for generating app icons from your profile image.

## Python Script (Recommended)

### Prerequisites

Install Python dependencies:
```bash
pip install -r scripts/requirements.txt
```

Or install Pillow directly:
```bash
pip install Pillow
```

### Usage

Generate all app icons from your profile image:

```bash
python scripts/generate_app_icons.py
```

Or specify a custom source image:

```bash
python scripts/generate_app_icons.py path/to/your/image.jpg
```

### What it does

1. **Loads your profile image** (defaults to `assets/icons/profile.jpg`)
2. **Creates circular icons** with proper padding and smooth edges
3. **Generates all Android sizes**:
   - mipmap-mdpi: 48x48
   - mipmap-hdpi: 72x72
   - mipmap-xhdpi: 96x96
   - mipmap-xxhdpi: 144x144
   - mipmap-xxxhdpi: 192x192
4. **Generates all iOS sizes**:
   - iPhone icons (20pt, 29pt, 40pt, 60pt at various scales)
   - iPad icons (20pt, 29pt, 40pt, 76pt, 83.5pt at various scales)
   - App Store icon (1024x1024)

### Features

- ✅ Automatic circular cropping
- ✅ High-quality image resizing (LANCZOS algorithm)
- ✅ Proper padding and centering
- ✅ Smooth edges with anti-aliasing
- ✅ Generates all required sizes for both platforms
- ✅ Optimized PNG output

## Flutter Launcher Icons (Alternative)

If you prefer using the Flutter package instead:

1. **Add your icon** to `assets/icons/app_icon.png` (1024x1024 recommended)

2. **Configure in pubspec.yaml**:
   ```yaml
   flutter_icons:
     android: true
     ios: true
     image_path: "assets/icons/app_icon.png"
     min_sdk_android: 21
     remove_alpha_ios: true
   ```

3. **Generate icons**:
   ```bash
   flutter pub get
   flutter pub run flutter_launcher_icons:main
   ```

## After Generating Icons

1. **Clean the build**:
   ```bash
   flutter clean
   ```

2. **Get dependencies**:
   ```bash
   flutter pub get
   ```

3. **Build and test**:
   ```bash
   flutter run
   ```

## Notes

- The Python script creates circular icons with a professional look
- Icons are optimized for both light and dark backgrounds
- All icons are generated with proper transparency handling
- The script preserves image quality while resizing

