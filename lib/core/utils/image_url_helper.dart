enum ImageSize {
  // Backdrop sizes
  backdropW300,
  backdropW780,
  backdropW1280,
  backdropOriginal,

  // Poster sizes
  posterW92,
  posterW154,
  posterW185,
  posterW342,
  posterW500,
  posterW780,
  posterOriginal,

  // Profile sizes
  profileW45,
  profileW185,
  profileH632,
  profileOriginal,

  // Still sizes
  stillW92,
  stillW185,
  stillW300,
  stillOriginal,

  // Logo sizes
  logoW45,
  logoW92,
  logoW154,
  logoW185,
  logoW300,
  logoW500,
  logoOriginal,
}

extension ImageSizeExtension on ImageSize {
  String get value {
    switch (this) {
      // Backdrop sizes
      case ImageSize.backdropW300:
        return 'w300';
      case ImageSize.backdropW780:
        return 'w780';
      case ImageSize.backdropW1280:
        return 'w1280';
      case ImageSize.backdropOriginal:
        return 'original';

      // Poster sizes
      case ImageSize.posterW92:
        return 'w92';
      case ImageSize.posterW154:
        return 'w154';
      case ImageSize.posterW185:
        return 'w185';
      case ImageSize.posterW342:
        return 'w342';
      case ImageSize.posterW500:
        return 'w500';
      case ImageSize.posterW780:
        return 'w780';
      case ImageSize.posterOriginal:
        return 'original';

      // Profile sizes
      case ImageSize.profileW45:
        return 'w45';
      case ImageSize.profileW185:
        return 'w185';
      case ImageSize.profileH632:
        return 'h632';
      case ImageSize.profileOriginal:
        return 'original';

      // Still sizes
      case ImageSize.stillW92:
        return 'w92';
      case ImageSize.stillW185:
        return 'w185';
      case ImageSize.stillW300:
        return 'w300';
      case ImageSize.stillOriginal:
        return 'original';

      // Logo sizes
      case ImageSize.logoW45:
        return 'w45';
      case ImageSize.logoW92:
        return 'w92';
      case ImageSize.logoW154:
        return 'w154';
      case ImageSize.logoW185:
        return 'w185';
      case ImageSize.logoW300:
        return 'w300';
      case ImageSize.logoW500:
        return 'w500';
      case ImageSize.logoOriginal:
        return 'original';
    }
  }
}

class ImageUrlHelper {
  static const _baseUrl = 'https://image.tmdb.org/t/p/';

  /// Mengembalikan URL gambar umum.
  static String getImageUrl(String? path, ImageSize size,
      {String defaultNullImage =
          'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'}) {
    if (path == null || path.isEmpty) {
      return defaultNullImage; // Gambar default jika path kosong
    }
    return '$_baseUrl${size.value}$path';
  }

  /// Mengembalikan URL backdrop.
  static String getBackdropUrl(String? backdropPath,
      {ImageSize size = ImageSize.backdropW780}) {
    return getImageUrl(backdropPath, size);
  }

  /// Mengembalikan URL poster.
  static String getPosterUrl(String? posterPath,
      {ImageSize size = ImageSize.posterW342}) {
    return getImageUrl(posterPath, size);
  }

  /// Mengembalikan URL profile.
  static String getProfileUrl(String? profilePath,
      {ImageSize size = ImageSize.profileW185}) {
    return getImageUrl(profilePath, size,
        defaultNullImage:
            'https://img.icons8.com/?size=480&id=z-JBA_KtSkxG&format=png');
  }

  /// Mengembalikan URL still.
  static String getStillUrl(String? stillPath,
      {ImageSize size = ImageSize.stillW300}) {
    return getImageUrl(stillPath, size);
  }

  /// Mengembalikan URL logo.
  static String getLogoUrl(String? logoPath,
      {ImageSize size = ImageSize.logoW300}) {
    return getImageUrl(logoPath, size);
  }
}
