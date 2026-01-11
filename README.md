# Manish Ranjan Portfolio App

A modern, clean, and fully responsive Flutter portfolio application showcasing work as an Android & Flutter Developer.

## 🚀 Overview

This mobile portfolio app is designed to highlight professional journey, technical skills, work experience, and major projects. It follows clean architecture principles, modern UI patterns, and provides an interactive way for companies and recruiters to explore work.

---

## ✅ What Works

### Core Features
- ✅ **Splash Screen** - Custom animated splash screen with profile picture and gradient background
- ✅ **Home / About Me** - Profile information, experience summary, and quick navigation
- ✅ **Skills Page** - Categorized skills display (Languages, Frameworks, Tools, Databases)
- ✅ **Experience Page** - Work history with detailed responsibilities
- ✅ **Projects Page** - Showcase of major projects with technologies used
- ✅ **Certifications Page** - Professional certifications display
- ✅ **Resume Viewer** - PDF viewing, download, and share functionality
- ✅ **Contact Page** - Contact information with email, phone, LinkedIn, GitHub, and contact form

### UI/UX Features
- ✅ **Light/Dark Mode** - Theme toggle in app bar with smooth transitions
- ✅ **Modern Design** - Neumorphic cards, glassmorphism panels, animated transitions
- ✅ **Navigation** - Bottom navigation bar and drawer menu
- ✅ **Responsive Layout** - Works on different screen sizes
- ✅ **Profile Image** - Integrated in splash screen, home page, and drawer

### Technical Implementation
- ✅ **Clean Architecture** - Feature-based structure with separation of concerns
- ✅ **State Management** - Flutter Bloc for theme management
- ✅ **Navigation** - AutoRoute for type-safe navigation
- ✅ **Dependency Injection** - GetIt + Injectable setup
- ✅ **App Icons** - Python script generates all required icon sizes from profile image
- ✅ **Secure Configuration** - Contact information stored securely (gitignored)

### Platform Support
- ✅ **Android** - Fully functional with custom app icon
- ✅ **iOS** - Configured and ready (requires Mac for building)

---

## ❌ What is Broken / Known Issues

### Splash Screen
- ⚠️ **Flutter Logo Screen** - Brief Flutter engine initialization screen appears before custom splash (this is a Flutter engine limitation, cannot be completely removed)
- ⚠️ **Native Launch Screen** - Gradient background shows, but Flutter logo may still appear briefly during engine initialization

### Resume Viewer
- ⚠️ **PDF Loading** - Requires `resume.pdf` file in `assets/resume/` folder. If missing, shows placeholder message
- ⚠️ **Share Functionality** - Currently commented out in code (needs testing on physical device)

### Contact Form
- ⚠️ **Backend Integration** - Contact form submission is not connected to any backend API (shows placeholder message)
- ⚠️ **Form Validation** - No input validation implemented yet

### Platform-Specific
- ⚠️ **iOS Build** - Requires Mac and Xcode for building (not tested on iOS device)
- ⚠️ **Android 12+** - Adaptive icons may need additional configuration for Android 12+

### Code Generation
- ⚠️ **Build Runner** - Must run `flutter pub run build_runner build --delete-conflicting-outputs` after cloning
- ⚠️ **Generated Files** - AutoRoute and Injectable generated files need to be regenerated if routes change

### Performance
- ⚠️ **Initial Load** - First app launch may show Flutter initialization screen briefly
- ⚠️ **Image Loading** - Profile image loading could be optimized with caching

---

## 🎯 What I Want to Do Next

### High Priority
- [ ] **Backend Integration** - Connect contact form to Firebase or backend API
- [ ] **Form Validation** - Add proper input validation and error handling for contact form
- [ ] **Resume PDF** - Add actual resume PDF to assets folder
- [ ] **Share Functionality** - Test and fix resume sharing on physical devices
- [ ] **iOS Testing** - Test and optimize for iOS devices

### Features to Add
- [ ] **Lottie Animations** - Replace static splash screen with Lottie animations
- [ ] **Offline Support** - Add local caching for offline viewing
- [ ] **Firebase Analytics** - Track visitor analytics
- [ ] **Push Notifications** - For contact form submissions (optional)
- [ ] **Testimonials Section** - Add testimonials/recommendations page
- [ ] **Blog Section** - Add "My Blog" feature mentioned in navigation
- [ ] **Play Store Integration** - In-app previews for projects available on Play Store

### UI/UX Improvements
- [ ] **Smooth Animations** - Add more micro-interactions and page transitions
- [ ] **Loading States** - Add skeleton loaders for better UX
- [ ] **Error Handling** - Better error messages and retry mechanisms
- [ ] **Accessibility** - Improve screen reader support and accessibility features
- [ ] **Localization** - Add multi-language support (i18n)

### Technical Improvements
- [ ] **Unit Tests** - Add unit tests for business logic
- [ ] **Widget Tests** - Add widget tests for UI components
- [ ] **Integration Tests** - Add end-to-end testing
- [ ] **CI/CD Pipeline** - Set up GitHub Actions for automated builds
- [ ] **Code Documentation** - Add comprehensive code comments and documentation
- [ ] **Performance Optimization** - Profile and optimize app performance
- [ ] **State Management** - Consider migrating to Riverpod for better testability

### Platform Enhancements
- [ ] **Android 12+ Adaptive Icons** - Full support for Android 12+ adaptive icons
- [ ] **iOS App Store Optimization** - Prepare for App Store submission
- [ ] **Web Support** - Make the app work on web platform
- [ ] **Desktop Support** - Consider Windows/Mac/Linux support

### Content Updates
- [ ] **More Projects** - Add additional projects to showcase
- [ ] **Updated Experience** - Keep work experience up to date
- [ ] **Skills Updates** - Add new skills as they're acquired
- [ ] **Certifications** - Add new certifications as earned

---

## 📦 Setup Instructions

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android SDK / Xcode (for mobile builds)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd manish_ranjan
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (AutoRoute & Injectable)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure contact information (IMPORTANT)**
   - Copy the config template: `cp lib/core/config/app_config.dart.example lib/core/config/app_config.dart`
   - Edit `lib/core/config/app_config.dart` and add your contact information
   - This file is gitignored for security - your sensitive data won't be committed

5. **Generate app icons from profile image**
   - Install Python dependencies: `pip install Pillow`
   - Run the icon generator: `python scripts/generate_app_icons.py`
   - This will create all required icon sizes for Android and iOS from your profile image
   - See `scripts/README.md` for more details

6. **Add your resume PDF**
   - Place your resume PDF file at `assets/resume/resume.pdf`
   - The app will use this file for the resume viewer

7. **Run the app**
   ```bash
   flutter run
   ```

### Build Commands

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

---

## 🔧 Configuration

### Setting Up Contact Information (Required)
1. Copy the config template:
   ```bash
   cp lib/core/config/app_config.dart.example lib/core/config/app_config.dart
   ```
2. Edit `lib/core/config/app_config.dart` and fill in your contact details:
   - Email address
   - Phone number (optional - can be hidden by setting `showPhoneNumber: false`)
   - LinkedIn username and URL
   - GitHub username and URL
   - Full name and professional title
3. **Security Note**: The `app_config.dart` file is gitignored, so your sensitive information won't be committed to version control.

### Generating App Icons
The app uses your profile image as the app icon. To generate all required icon sizes:

1. **Using Python Script (Recommended)**:
   ```bash
   pip install Pillow
   python scripts/generate_app_icons.py
   ```
   This generates circular icons for all Android and iOS sizes automatically.

2. **Using Flutter Launcher Icons (Alternative)**:
   - Place a 1024x1024 icon at `assets/icons/app_icon.png`
   - Uncomment the `flutter_icons` section in `pubspec.yaml`
   - Run: `flutter pub run flutter_launcher_icons:main`

See `scripts/README.md` for detailed instructions.

### Adding Your Resume
1. Place your resume PDF file in `assets/resume/resume.pdf`
2. The app will automatically load it in the Resume Viewer

### Customizing Theme Colors
Edit `lib/core/theme/app_theme.dart` to customize:
- Primary colors (Flutter Blue)
- Secondary colors (Android Green)
- Light/Dark theme colors

### Adding More Projects/Certifications
- Projects: Edit `lib/features/projects/presentation/pages/projects_page.dart`
- Certifications: Edit `lib/features/certifications/presentation/pages/certifications_page.dart`

---

## 🏗 App Architecture

Follows Flutter Clean Architecture with feature-based structure:

```
lib/
 ├─ core/
 │   ├─ theme/          # Theme configuration & theme cubit
 │   ├─ routing/         # AutoRoute configuration
 │   ├─ widgets/         # Reusable widgets
 │   ├─ di/              # Dependency injection setup
 │   └─ config/          # App configuration (gitignored)
 ├─ features/
 │   ├─ splash/          # Splash screen
 │   ├─ about/           # About/Home page
 │   ├─ skills/          # Skills showcase
 │   ├─ experience/      # Work experience
 │   ├─ projects/        # Projects showcase
 │   ├─ certifications/  # Certifications
 │   ├─ resume/          # Resume viewer
 │   └─ contact/         # Contact information
 ├─ data/                # Data layer (repositories, datasources)
 ├─ domain/              # Domain layer (entities, usecases)
 └─ presentation/        # Presentation layer (pages, widgets, bloc)
```

### Tech Stack
- **State Management**: Flutter Bloc
- **Navigation**: AutoRoute
- **Dependency Injection**: GetIt + Injectable
- **PDF Viewer**: Syncfusion Flutter PDF Viewer
- **URL Launcher**: url_launcher
- **Share**: share_plus
- **Storage**: shared_preferences

---

## 📱 Screenshots

*Add screenshots of your app here*

---

## 📄 License

This project is private and not licensed for public use.

---

## 👨‍💻 Contact

**Manish Ranjan** – Mobile App Developer (Android & Flutter)

- 📧 Email: manishranjan.soft@gmail.com
- 🔗 LinkedIn: [manishranjansubah](https://linkedin.com/in/manishranjansubah)
- 🔗 GitHub: [manishsubah](https://github.com/manishsubah)

*For phone contact, please use the app's Contact tab after installation.*

---

**Built with ❤️ using Flutter**

*Last Updated: December 2024*
