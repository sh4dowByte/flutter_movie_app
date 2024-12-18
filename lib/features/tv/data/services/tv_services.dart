import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/data/models/movie_clip.dart';
import 'package:flutter_movie_app/core/data/services/tmdb_services.dart';
import 'package:flutter_movie_app/core/data/models/genres.dart';
import 'package:flutter_movie_app/core/data/models/stills_images.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/people/data/models/tv_credits.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_detail.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_episode.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_seasons.dart';
import 'package:intl/intl.dart';

class TVService extends TMDBService {
  TVService(super.ref);

  Future<List<Tv>> fetchPopularTv(int page) async {
    try {
      final response = await dio.get('/3/tv/popular', queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        final List tv = response.data['results'];
        return tv.map((data) => Tv.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch popular tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Tv>> fetchTopRatedTv(int page) async {
    try {
      final response = await dio.get('/3/tv/top_rated', queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        final List tv = response.data['results'];
        return tv.map((data) => Tv.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch top rated tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Tv>> fetchOnTheAirTv(int page) async {
    try {
      final response = await dio.get('/3/tv/on_the_air', queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        final List tv = response.data['results'];
        return tv.map((data) => Tv.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch on the air tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Tv>> fetchAiringTodayTv(int page) async {
    try {
      // final response = await dio.get('/3/tv/airing_today', queryParameters: {
      //   'page': page,
      // });

      final todayString = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final response = await dio.get('/3/discover/tv', queryParameters: {
        'include_adult': false,
        'language': 'en-US',
        'page': page,
        'sort_by': 'popularity.desc',
        'with_genres': 16, // Anime
        'air_date.lte': todayString,
        'air_date.gte': todayString,
      });

      if (response.statusCode == 200) {
        final List tv = response.data['results'];
        return tv.map((data) => Tv.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch airing today tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Tv>> fetchDiscoverTv({int page = 1, int genres = 0}) async {
    try {
      final response = await dio.get(
        '/3/discover/tv',
        queryParameters: {
          'page': page,
          'sort_by': 'popularity.desc',
          'with_genres': genres == 0 ? '' : genres
        },
      );

      if (response.statusCode == 200) {
        final List tv = response.data['results'];
        return tv.map((data) => Tv.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch recommended tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Tv>> fetchRecomendedTv(int seriesId, {int page = 1}) async {
    try {
      final response = await dio.get(
        '/3/tv/$seriesId/recommendations',
        queryParameters: {
          'page': page,
        },
      );

      if (response.statusCode == 200) {
        final List tv = response.data['results'];
        return tv.map((data) => Tv.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch recommended tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Tv>> searchTv(String keyword, {int page = 1}) async {
    try {
      final response = await dio.get('/3/search/tv', queryParameters: {
        'page': page,
        'query': keyword,
      });

      if (response.statusCode == 200) {
        final List tv = response.data['results'];
        return tv.map((data) => Tv.fromJson(data)).toList();
      } else {
        throw Exception('Failed to search tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<TvDetail> fetchTvDetails(int seriesId) async {
    try {
      final response = await dio.get(
        '/3/tv/$seriesId',
      );

      if (response.statusCode == 200) {
        return TvDetail.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch details tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<TvSeason> fetchTvSessions(int seriesId, int sessionNumber) async {
    try {
      final response = await dio.get('/3/tv/$seriesId/season/$sessionNumber');

      if (response.statusCode == 200) {
        return TvSeason.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch details tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<TvEpisode> fetchTvEpisode(
      int seriesId, int sessionNumber, int episodeNumber) async {
    try {
      final response = await dio
          .get('/3/tv/$seriesId/season/$sessionNumber/episode/$episodeNumber');

      if (response.statusCode == 200) {
        return TvEpisode.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch details tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<StillsImage>> fetchStillsImage(
      int seriesId, int sessionNumber, int episodeNumber) async {
    try {
      final response = await dio.get(
        '/3/tv/$seriesId/season/$sessionNumber/episode/$episodeNumber/images',
        options: Options(
          extra: {
            'noLanguage': true
          }, // Tandai request ini untuk skip 'language'
        ),
      );

      if (response.statusCode == 200) {
        final List stills = response.data['stills'];
        return stills.map((data) => StillsImage.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch details tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Genres>> fetchGenres() async {
    try {
      final response = await dio.get(
        '/3/genre/tv/list',
      );

      if (response.statusCode == 200) {
        final List data = response.data['genres'];
        return data.map((data) => Genres.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch genre');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<TvCredits> fetchCreditTv(int seriesId) async {
    try {
      final response = await dio.get('/3/tv/$seriesId/credits');

      if (response.statusCode == 200) {
        final credit = response.data;
        return TvCredits.fromJson(credit);
      } else {
        throw Exception('Failed to fetch credit tv');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<MovieClip>> fetchTvClip(int seriesId,
      {int? seasonNumber, int? episodeNumber}) async {
    try {
      String endpoint = '/3/tv/$seriesId';

      if (seasonNumber != null) {
        endpoint += '/season/$seasonNumber';
        if (episodeNumber != null) {
          endpoint += '/episode/$episodeNumber';
        }
      }

      endpoint += '/videos';

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        final List data = response.data['results'];
        return data.map((data) => MovieClip.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch TV clips');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
