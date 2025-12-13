# Manish Ranjan Portfolio App

A modern, clean, and fully responsive Flutter portfolio application showcasing work as an Android & Flutter Developer.

## 🚀 Overview

This mobile portfolio app is designed to highlight professional journey, technical skills, work experience, and major projects. It follows clean architecture principles, modern UI patterns, and provides an interactive way for companies and recruiters to explore work.

## ✨ Features

### ✔ Splash Screen
- Smooth logo + name animation
- Tagline: Mobile App Developer — Android & Flutter

### ✔ Home / About Me
- Name and title display
- Summary of 2+ years experience
- Highlights of Android + Flutter skills
- Quick navigation buttons

### ✔ Skills
Categorized into:
- **Languages**: Kotlin, Java, Dart
- **Frameworks & Libraries**: Flutter, Jetpack Compose, Retrofit, Room DB, Firebase, Bloc, Provider, Riverpod, Mason, OkHttp, Espresso
- **Tools**: Android Studio, VS Code, GitHub, Gradle, Firebase Console, Postman, GitHub Actions
- **Databases**: Room DB, SQL, Firestore, sqflite

### ✔ Experience
- Software Engineer – 12th Wonder Research India Pvt. Ltd
- April 2023 – Present | Remote / Pune
- Detailed responsibilities and achievements

### ✔ Projects
1. **Titan TLM** - Test Lifecycle Management app
2. **Live Assist** - Product scanning and video consultation app
3. **WonderHealth IFT** - Fasting + health tracking application

### ✔ Certifications
- AI Tools & ChatGPT – Be10x
- Java & Data Structures – Apna College

### ✔ Resume Viewer
- In-app PDF Viewer
- Download Resume
- Share Resume

### ✔ Contact Me
- Email: manishranjan.soft@gmail.com
- Phone: +91 8298285796
- LinkedIn: manishranjansubah
- GitHub: manishsubah
- Contact form (optional backend integration)

## 🎨 UI/UX Design

### Theme
- Clean minimal design
- Light/Dark mode support
- Flutter Blue: #0066FF
- Android Green: #00D27F

### Components
- Neumorphic cards
- Glassmorphism panels
- Animated transitions
- Skill chips
- Modern Material Design 3

### Navigation
- Bottom navigation (Home, Skills, Projects, Contact)
- Drawer for Resume, Certifications, Experience, Settings

## 🏗 App Architecture

Follows Flutter Clean Architecture with feature-based structure:

```
lib/
 ├─ core/
 │   ├─ theme/          # Theme configuration & theme cubit
 │   ├─ routing/         # AutoRoute configuration
 │   ├─ widgets/         # Reusable widgets
 │   └─ di/              # Dependency injection setup
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
- **PDF Viewer**: pdfx
- **URL Launcher**: url_launcher
- **Share**: share_plus
- **Storage**: shared_preferences

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

3. **Generate code (for AutoRoute and Injectable)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Add your resume PDF**
   - Place your resume PDF file at `assets/resume/resume.pdf`
   - The app will use this file for the resume viewer

5. **Run the app**
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

## 🔧 Configuration

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

## 📱 Screenshots

*Add screenshots of your app here*

## 🚧 Future Enhancements

- [ ] In-app Play Store previews
- [ ] Firebase analytics (for visitor tracking)
- [ ] Offline support with local caching
- [ ] Contact form with Firebase/Backend API integration
- [ ] Lottie animations for splash screen
- [ ] Testimonials section

## 📄 License

This project is private and not licensed for public use.

## 👨‍💻 Contact

**Manish Ranjan** – Mobile App Developer (Android & Flutter)

- 📧 Email: manishranjan.soft@gmail.com
- 📞 Phone: +91 8298285796
- 🔗 LinkedIn: [manishranjansubah](https://linkedin.com/in/manishranjansubah)
- 🔗 GitHub: [manishsubah](https://github.com/manishsubah)

---

Built with ❤️ using Flutter
