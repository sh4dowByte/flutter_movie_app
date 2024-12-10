![1733615477380](image/README/Thumbnail.png)

<p align="center">
    <img src="https://github.com/sh4dowByte/flutter_movie_app/actions/workflows/main.yaml/badge.svg?branch=release" alt="CI/CD Badge" style="max-width: 100%;">
    <img src="https://badgen.net/badge/Flutter/3.19.3/blue" alt="Flutter Version" style="max-width: 100%;">
    <img src="https://badgen.net/badge/Dart/3.3.1/blue" alt="Dart Version" style="max-width: 100%;">
    <img src="https://img.shields.io/badge/License-CC%20BY--NC%204.0-lightgrey.svg" alt="Dart Version" style="max-width: 100%;">
</p>

# Flutter Movie Ticket

Flutter Movie Ticket is a Flutter-based application designed to provide up-to-date information about both currently playing and upcoming movies. This app utilizes the TMDB API (The Movie Database API) to present movie data such as synopses, reviews, genres, posters, and other detailed information. With a modern and intuitive interface, users can easily browse through popular movie listings, explore genre categories, or view detailed information about films that catch their interest.

This application is designed to help movie enthusiasts stay up-to-date with the world of cinema. Without ticket booking or watchlist features, Flutter Movie Ticket focuses on providing a simple yet informative movie exploration experience. With data continuously updated in real-time via the TMDB API, users can enjoy fast, accurate, and easily accessible service at any time.

<a href="https://github.com/sh4dowByte/flutter_movie_app/releases/download/v1.0.0%2B1-1/app-release.apk">
    <img src="https://playerzon.com/asset/download.png" width="200" data-canonical-src="https://playerzon.com/asset/download.png" style="max-width: 100%;">
</a>

## 🎨 Design

The design of this application is based on the provided Figma file. The slicing process was carried out meticulously to ensure the application accurately represents the design.

## 🚀 Features

- **Seamless Navigation**: Enjoy smooth navigation between screens using Flutter's Navigator for an intuitive user experience.
- **Reusable Components**: Designed with modular and reusable components to ensure maintainable and scalable development.
- **Movie Search**: Quickly find your favorite movies with a powerful search feature that fetches real-time data from TMDB API.
- **Popular Movies**: Explore the latest and trending movies through a dedicated section that showcases popular films based on real-time data.

## 🛠️ Technologies

- **[Flutter](https://flutter.dev/)**: A framework for cross-platform application development.
- **[Dart](https://dart.dev/)**: The primary programming language for Flutter.
- **[Google Fonts](https://fonts.google.com/)**: For custom font integration.
- **[Figma](https://www.figma.com/)**: Used as the application's design reference.

## 📚 Dependencies

### **Core**
1. **[flutter](https://flutter.dev/)**  
   - The SDK used for building multiplatform apps (iOS, Android, Web, etc.).

2. **[cupertino_icons](https://pub.dev/packages/cupertino_icons)**  
   - iOS-style icons for app design.

3. **[flutter_svg](https://pub.dev/packages/flutter_svg)**  
   - Provides support for rendering SVG files in the app.

4. **[google_fonts](https://pub.dev/packages/google_fonts)**  
   - Makes it easy to use Google Fonts in Flutter apps.

5. **[cached_network_image](https://pub.dev/packages/cached_network_image)**  
   - Enables image caching for better performance and reduced network usage.

6. **[shimmer](https://pub.dev/packages/shimmer)**  
   - Creates a shimmer effect for loading placeholders, enhancing user experience.

7. **[barcode](https://pub.dev/packages/barcode)**  
   - Generates barcodes for data visualization needs.

8. **[dio](https://pub.dev/packages/dio)**  
   - A powerful HTTP client for handling API requests with features like interceptors and timeout.

9. **[intl](https://pub.dev/packages/intl)**  
   - Manages formatting for dates, numbers, and locales.

10. **[flutter_dotenv](https://pub.dev/packages/flutter_dotenv)**  
    - Loads environment variables from a `.env` file.

11. **[sqflite](https://pub.dev/packages/sqflite)**  
    - SQLite plugin for local data storage.

12. **[path](https://pub.dev/packages/path)**  
    - Utilities for managing file and directory paths.

### **State Management and Architecture**
13. **[dartz](https://pub.dev/packages/dartz)**  
    - A functional programming library to handle success and error values more effectively.

14. **[flutter_riverpod](https://pub.dev/packages/flutter_riverpod)**  
    - A modern state management library for Flutter.

### **Data Serialization**
15. **[freezed_annotation](https://pub.dev/packages/freezed_annotation)**  
    - Simplifies creating immutable models with code generation.

16. **[json_serializable](https://pub.dev/packages/json_serializable)**  
    - Converts Dart objects to JSON and vice versa.

17. **[json_annotation](https://pub.dev/packages/json_annotation)**  
    - Used alongside `json_serializable` for data model annotations.

## Dev Dependencies

1. **[build_runner](https://pub.dev/packages/build_runner)**  
   - A tool for running code generators like `freezed` and `json_serializable`.

2. **[freezed](https://pub.dev/packages/freezed)**  
   - Generates immutable data classes automatically.

3. **[mockito](https://pub.dev/packages/mockito)**  
   - A library for creating mocks during unit testing.

4. **[test](https://pub.dev/packages/test)**  
   - A testing library for writing and running automated tests.

5. **[flutter_test](https://pub.dev/packages/flutter_test)**  
   - Flutter's built-in testing library.

6. **[flutter_lints](https://pub.dev/packages/flutter_lints)**  
   - A set of recommended linting rules for clean and consistent code.


## ⚙️ Setup Environment

To build this project locally, you need to add your TMDB API key. Follow the steps below to set up the environment variables:

1. **Copy the `env` file to `.env`** in the root directory of the project.
   
   If you already have an `env` file, copy it with the following command:
   ```bash
   cp env .env
   ```

2. **Add the TMDB API key** in the `.env` file:

   Open the `.env` file and add the following line:
   ```plaintext
   TMDB_ACCESS_TOKEN=YOUR_API_KEY
   ```

   Replace `YOUR_API_KEY` with your actual API key from [The Movie Database (TMDB)](https://www.themoviedb.org/).


## License

Copyright 2024 Ahmad Juhdi
```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## Disclaimer

UI/UX Design Credit: The design of this application is inspired by the [Figma template](https://www.figma.com/community/file/1389799043219043260/order-movies-ticket-app) created by **Yalie Uzcategui.**
