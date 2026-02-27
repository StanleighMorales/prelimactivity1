# Open Library Explorer

A Flutter application that integrates with the Open Library API to browse, search, and explore books.

## API Integration

**API Name:** Open Library API  
**Base URL:** https://openlibrary.org  
**Documentation:** https://openlibrary.org/developers/api

## Integrated Endpoints

This app integrates **4 distinct endpoints** from the Open Library API:

### 1. Trending Books (GET /trending/daily.json)

- **Purpose:** Fetches the daily trending books
- **Screen:** Trending Books tab (home screen)
- **Features:** Pull-to-refresh, displays book covers, titles, authors, and publication years

### 2. Search Books (GET /search.json)

- **Purpose:** Search for books by title, author, or keywords
- **Screen:** Search Books tab
- **Features:** Real-time search, clear search functionality, displays search results with covers

### 3. Books by Subject (GET /subjects/{subject}.json)

- **Purpose:** Browse books filtered by subject/genre
- **Screen:** Browse by Subject tab
- **Features:** Dropdown selector for 10+ subjects (fiction, fantasy, sci-fi, mystery, etc.)

### 4. Book Details (GET /works/{key}.json)

- **Purpose:** Get detailed information about a specific book
- **Screen:** Book Details page (accessible by tapping any book)
- **Features:** Full book description, cover image, subjects/tags, page count

## Architecture

The app follows clean architecture principles adapted from the flutter_api_network reference:

- **Models** (`lib/models/`): Dart classes for Book and BookDetails with JSON serialization
- **Services** (`lib/services/`): OpenLibraryService handles all API calls using Dio HTTP client
- **Screens** (`lib/screens/`): UI pages for each feature/endpoint
- **Error Handling**: Try-catch blocks with user-friendly error messages and retry buttons
- **Loading States**: CircularProgressIndicator shown during API calls

## UI/Theme Choices

The app uses a clean, minimalist black-and-white theme that emphasizes readability and content:

- Black app bar with white text for strong contrast
- White background for easy reading
- Book covers as visual focal points
- Bottom navigation for easy access to all features
- Material Design components for familiar UX

## Dependencies

- `dio: ^5.9.1` - HTTP client for API requests
- `flutter` - Flutter SDK

## Getting Started

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

## Features Checklist

- [x] API from public-apis list (Open Library)
- [x] 4+ endpoints integrated
- [x] Each endpoint visible in app
- [x] HTTP client (Dio) with consistent base URL
- [x] Dart models for JSON responses
- [x] Service layer for API calls
- [x] Error handling with retry functionality
- [x] Loading states
- [x] Bottom navigation for feature access
- [x] Thematic UI aligned with books/reading
