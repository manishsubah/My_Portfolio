# Setup Instructions

## Quick Start

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Generate code (AutoRoute & Injectable):**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Add your resume PDF:**
   - Place your resume PDF at `assets/resume/resume.pdf`
   - If you don't have a resume PDF, the app will show a placeholder

4. **Run the app:**
   ```bash
   flutter run
   ```

## Important Notes

- **Code Generation Required**: This project uses AutoRoute and Injectable which require code generation. You MUST run `build_runner` before the app will compile.

- **Resume PDF**: The resume viewer expects a PDF file at `assets/resume/resume.pdf`. If the file doesn't exist, a placeholder message will be shown.

- **First Run**: After running `flutter pub get`, you may see linting errors. These will be resolved after running `build_runner`.

## Troubleshooting

### Build Runner Issues
If build_runner fails:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Missing Dependencies
If you see package errors:
```bash
flutter pub upgrade
flutter pub get
```

### Generated Files
The following files are auto-generated and should NOT be edited manually:
- `lib/core/routing/app_router.gr.dart`
- `lib/core/di/injection.config.dart`

