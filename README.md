# Movie App – Flutter Lab Project

**Course:** CS506PC – UI Design (Flutter Lab)  
**Project:** Movie App  
**Technology:** Flutter, Dart

## 1. Project Description

Movie App is a Flutter application that displays movie information through a responsive user interface. It integrates REST API data, movie search, favorites management, reusable widgets, animations, and responsive layouts.

The project demonstrates concepts covered in the prescribed Flutter lab experiments.

## 2. Features

- Movie listing using REST API data
- Movie search and clear-search functionality
- Movie details screen and navigation
- Add and remove favorite movies
- Favorite count indicator
- Responsive movie grid
- Light theme and reusable styling
- Form validation
- Fade-in, slide-in, and hover animations
- Refresh functionality
- Loading, error, and empty states
- Unit and widget tests

## 3. Lab Experiment Mapping

### Experiment 1 – Flutter and Dart Basics
The project uses Flutter widgets, Dart classes, imports, functions, and the standard Flutter application structure.

**Source:** `lib/main.dart`

### Experiment 2 – Flutter Widgets and Layouts
The application uses Text, Image, Container, Icon, buttons, Row, Column, Stack, Card, and other layout widgets.

**Sources:** `lib/widgets/`, `lib/screens/`

### Experiment 3 – Responsive UI Design
The movie grid adjusts its column count according to the available screen width using LayoutBuilder.

**Source:** `lib/screens/home_screen.dart`

### Experiment 4 – Navigation
Navigation is used to move between the home screen, movie details screen, and favorites screen.

**Sources:** `lib/widgets/movie_card.dart`, `lib/screens/`

### Experiment 5 – State Management
StatefulWidget and setState manage screen-level state, while Provider and ChangeNotifier manage favorite movies.

**Source:** `lib/providers/favorite_provider.dart`

### Experiment 6 – Custom Widgets and Themes
Reusable components include movie cards, section titles, rating badges, animation widgets, and state messages. ThemeData defines shared application styling.

**Sources:** `lib/widgets/`, `lib/theme/app_theme.dart`

### Experiment 7 – Forms and Validation
The movie search form validates input and supports searching and clearing the query.

**Source:** `lib/widgets/movie_search_form.dart`

### Experiment 8 – Animations
Fade-in, slide-in, and hover animations enhance the movie browsing experience.

**Sources:** `lib/widgets/fade_in_animation.dart`, `lib/widgets/slide_in_animation.dart`, `lib/widgets/movie_card.dart`

### Experiment 9 – REST API and JSON
The application sends HTTP requests, parses JSON responses, and converts the returned data into Movie model objects.

**Sources:** `lib/services/movie_api_service.dart`, `lib/models/movie.dart`

### Experiment 10 – Testing and Debugging
Unit and widget tests check movie model data, favorite management, the rating badge, and application UI.

**Sources:** `test/`

> Verify each source path and feature against the current project before submission. Include only concepts that are actually implemented and working.

## 4. Screenshots and Evidence

Add screenshots of the actual application and relevant source code in this section.

### Home Screen and Movie Listing
<!-- Add screenshot: screenshots/home_screen.png -->

### Responsive Layout
<!-- Add mobile, tablet, and desktop screenshots -->

### Navigation and Movie Details
<!-- Add screenshot: screenshots/movie_details.png -->

### Favorites and State Management
<!-- Add screenshot: screenshots/favorites_screen.png -->

### Search and Form Validation
<!-- Add screenshot: screenshots/movie_search.png -->

### Animations and Custom Widgets
<!-- Add screenshots of the relevant UI and source code -->

### REST API Integration
<!-- Add screenshot of API results and movie_api_service.dart -->

### Testing and Debugging
<!-- Add screenshot showing flutter analyze and flutter test results -->

## 5. How to Run the Project

Install Flutter and configure your development environment.

Clone the repository:

```bash
git clone https://github.com/manichandan-alt/movie_app.git
cd movie_app
```

Install dependencies:

```bash
flutter pub get
```

Run the application in Chrome:

```bash
flutter run -d chrome
```

Analyze the project:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

## 6. Project Structure

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
```

## 7. GitHub Repository

[Movie App Repository](https://github.com/manichandan-alt/movie_app)

## 8. Conclusion

This project demonstrates the application of Flutter UI design concepts through a movie browsing application. The source code, working output, test results, and screenshots provide evidence of the implemented lab concepts.