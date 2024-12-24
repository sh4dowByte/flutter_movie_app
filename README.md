![1733615477380](image/README/Thumbnail.png)

<p align="center">
    <img src="https://github.com/sh4dowByte/flutter_movie_app/actions/workflows/main.yaml/badge.svg?branch=release" alt="CI/CD Badge" style="max-width: 100%;">
    <img src="https://badgen.net/badge/Flutter/3.19.3/blue" alt="Flutter Version" style="max-width: 100%;">
    <img src="https://badgen.net/badge/Dart/3.3.1/blue" alt="Dart Version" style="max-width: 100%;">
    <img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="Dart Version" style="max-width: 100%;">
</p>

# Flutter Movie App

Flutter Movie App is a Flutter-based application designed to provide up-to-date information about both movies and TV series, including currently playing and upcoming releases. This app utilizes the TMDB API (The Movie Database API) to present detailed data such as synopses, reviews, genres, posters, and other essential information. With a modern and user-friendly interface, users can easily browse through popular movies and TV series, explore genre categories, or view detailed insights about their favorites.

This application is ideal for movie and TV series enthusiasts who want to stay updated with the latest entertainment content. By focusing on providing a seamless exploration experience without features like ticket booking or watchlists, Flutter Movie App delivers real-time, accurate, and fast data updates directly via the TMDB API. Whether you're a fan of cinema or television, this app ensures you always have the latest information at your fingertips.

<a href="https://github.com/sh4dowByte/flutter_movie_app/releases/download/v1.0.0%2B1-12/app-release.apk">
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

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Ahmad Juhdi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Disclaimer

UI/UX Design Credit: The design of this application is inspired by the [Figma template](https://www.figma.com/community/file/1389799043219043260/order-movies-ticket-app) created by **Yalie Uzcategui.**


## Thanks
This application uses data provided by [TMDB API](https://www.themoviedb.org/documentation/api). We sincerely thank TMDB for making their API accessible for developers.