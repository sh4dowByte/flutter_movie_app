enum ImageSize {
  w300,
  w780,
  w1280,
  original,
  w45,
  w92,
  w154,
  w185,
  w342,
  w500,
  w780poster,
  h632,
}

extension ImageSizeExtension on ImageSize {
  String get value {
    switch (this) {
      case ImageSize.w300:
        return 'w300';
      case ImageSize.w780:
        return 'w780';
      case ImageSize.w1280:
        return 'w1280';
      case ImageSize.original:
        return 'original';
      case ImageSize.w45:
        return 'w45';
      case ImageSize.w92:
        return 'w92';
      case ImageSize.w154:
        return 'w154';
      case ImageSize.w185:
        return 'w185';
      case ImageSize.w342:
        return 'w342';
      case ImageSize.w500:
        return 'w500';
      case ImageSize.w780poster:
        return 'w780';
      case ImageSize.h632:
        return 'h632';
    }
  }
}

class ImageUrlHelper {
  static const _baseUrl = 'https://image.tmdb.org/t/p/';

  static String getImageUrl(String? path, ImageSize size,
      {bool isBackdrop = false}) {
    if (path == null || path.isEmpty) {
      return 'https://img.icons8.com/?size=480&id=zGSj13jiurKj&format=png'; // Default jika path kosong
    }
    return '$_baseUrl${size.value}$path';
  }

  static String getBackdropUrl(String? backdropPath,
      {ImageSize size = ImageSize.w300}) {
    return getImageUrl(backdropPath, size, isBackdrop: true);
  }

  static String getPosterUrl(String? posterPath,
      {ImageSize size = ImageSize.w300}) {
    return getImageUrl(posterPath, size);
  }
}
