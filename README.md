# Movie App – Flutter Lab Project

**Course:** CS506PC – UI Design (Flutter Lab)  
**Project:** Movie App  
**Technology:** Flutter, Dart

## 1. Project Description

Movie App is a Flutter application for browsing movie information. The project demonstrates movie listing, search, responsive layouts, navigation, reusable widgets, Provider-based state management, REST API integration, animations, and tests.

## 2. Features

- Movie listing loaded from a REST API
- Movie search and clear-search functionality
- Movie details screen and named-route navigation
- Favorites screen and Provider-based favorite state
- Responsive movie grid using LayoutBuilder
- Reusable widgets and shared theme styling
- Fade-in and slide-in animations
- Loading, error, and empty states
- Unit and widget tests

## 3. Lab Experiment Mapping and Evidence

The screenshots below are captured from the compiled Flutter web application by the GitHub Actions workflow. They are real browser screenshots, not mockups. Source-code and test-based experiments are mapped to their implementation files because those concepts are not all separate screens.

### Experiment 1 – Flutter and Dart Basics
Flutter app entry point, Dart classes, imports, and application structure.

**Source:** `lib/main.dart`, `lib/models/movie.dart`

**Visual evidence:** [Home screen](screenshots/01-home-screen.png)

### Experiment 2 – Flutter Widgets and Layouts
Text, Image, Container, Icon, Row, Column, Stack, Card, buttons, and layout widgets.

**Sources:** `lib/screens/`, `lib/widgets/`

**Visual evidence:** [Home screen](screenshots/01-home-screen.png)

### Experiment 3 – Responsive UI Design
The movie grid changes its column count according to the available width using LayoutBuilder.

**Source:** `lib/screens/home_screen.dart`

**Visual evidence:**
- [Desktop layout](screenshots/01-home-screen.png)
- [Mobile layout](screenshots/02-responsive-mobile.png)
- [Tablet layout](screenshots/03-responsive-tablet.png)

### Experiment 4 – Navigation
Named-route navigation to the movie details screen and navigation to the favorites screen.

**Sources:** `lib/main.dart`, `lib/widgets/movie_card.dart`, `lib/screens/movie_details_screen.dart`, `lib/screens/favorites_screen.dart`

### Experiment 5 – State Management
ChangeNotifier and Provider expose favorite state to the widget tree.

**Source:** `lib/providers/favorite_provider.dart`

**Test evidence:** `test/favorite_provider_test.dart`

### Experiment 6 – Custom Widgets and Themes
Reusable movie cards, rating badges, section titles, state messages, animation widgets, and ThemeData.

**Sources:** `lib/widgets/`, `lib/theme/app_theme.dart`

**Visual evidence:** [Home screen](screenshots/01-home-screen.png)

### Experiment 7 – Forms and Validation
The movie search form validates input and supports search and clear-search actions.

**Source:** `lib/widgets/movie_search_form.dart`

**Visual evidence:** [Home screen with search form](screenshots/01-home-screen.png)

### Experiment 8 – Animations
Fade-in and slide-in animation widgets are used when displaying movie cards.

**Sources:** `lib/widgets/fade_in_animation.dart`, `lib/widgets/slide_in_animation.dart`, `lib/widgets/movie_card.dart`

### Experiment 9 – REST API and JSON
The app sends an HTTP request, decodes JSON, and maps response data into Movie model objects.

**Sources:** `lib/services/movie_api_service.dart`, `lib/models/movie.dart`

**Visual evidence:** [Movie listing](screenshots/01-home-screen.png)

### Experiment 10 – Testing and Debugging
Unit and widget tests cover the movie model, favorite provider, rating badge, and app UI. The screenshot workflow runs `flutter analyze` and `flutter test` before capturing screenshots.

**Sources:** `test/`

## 4. Screenshots

| Screenshot | Description |
|---|---|
| ![Desktop home screen](screenshots/01-home-screen.png) | Desktop home screen and movie listing |
| ![Mobile responsive layout](screenshots/02-responsive-mobile.png) | Phone-width responsive layout |
| ![Tablet responsive layout](screenshots/03-responsive-tablet.png) | Tablet-width responsive layout |

## 5. Automatic Screenshot Capture

GitHub Actions workflow: `.github/workflows/capture-screenshots.yml`

- Runs on pushes affecting the app, tests, README, or screenshot workflow.
- Can also be started manually from **Actions → Capture Movie App Screenshots → Run workflow**.
- Installs Flutter, runs `flutter analyze` and `flutter test`, builds the web app, and captures desktop, mobile, and tablet screenshots.
- Commits generated PNG files into the `screenshots/` directory.

## 6. How to Run the Project

Install Flutter, then run:

```bash
git clone https://github.com/manichandanreddy1775/movie_app.git
cd movie_app
flutter pub get
flutter run -d chrome
```

Run checks:

```bash
flutter analyze
flutter test
```

## 7. Project Structure

```text
lib/
  data/
  models/
  providers/
  screens/
  services/
  theme/
  widgets/
test/
screenshots/
.github/
  scripts/
  workflows/
```

## 8. GitHub Repository

[Movie App Repository](https://github.com/manichandanreddy1775/movie_app)

## 9. Conclusion

This project applies Flutter UI design concepts in a movie browsing application. The source files, tests, and screenshots provide evidence of the implemented lab experiments.
