import 'package:flutter_movie_app/core/data/services/tmdb_services.dart';
import 'package:flutter_movie_app/core/utils/storage/movie_genre_storage.dart';
import 'package:flutter_movie_app/features/people/data/models/cast.dart';
import 'package:flutter_movie_app/core/data/models/genres.dart';
import 'package:flutter_movie_app/core/data/models/movie_clip.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie_detail.dart';
import 'package:intl/intl.dart';
import '../models/movie.dart';

class MovieService extends TMDBService {
  MovieService();

  Future<List<Movie>> fetchPopularMovies(int page) async {
    try {
      final genreId = await MovieGenreStorageUtils.getGenresStr();
      final response = await dio.get('/3/discover/movie', queryParameters: {
        'page': page,
        'sort_by': 'popularity.desc',
        'with_genres': genreId,
      });

      if (response.statusCode == 200) {
        final List movies = response.data['results'];
        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch popular movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<MovieClip>> fetchMovieClip(int movieId) async {
    try {
      final response =
          await dio.get('/3/movie/$movieId/videos', queryParameters: {
        'language': 'en-US',
      });

      if (response.statusCode == 200) {
        final List moviesClip = response.data['results'];
        return moviesClip.map((movie) => MovieClip.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch clip movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> fetchTopRatedMovies(int page) async {
    try {
      final genreId = await MovieGenreStorageUtils.getGenresStr();
      final response = await dio.get('/3/discover/movie', queryParameters: {
        'page': page,
        'sort_by': 'vote_average.desc',
        'with_genres': genreId,
        'without_genres': '99,10755',
        'vote_count.gte': '200',
      });

      if (response.statusCode == 200) {
        final List movies = response.data['results'];
        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch top rated movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> fetchUpcomingMovies(int page) async {
    try {
      final genreId = await MovieGenreStorageUtils.getGenresStr();
      DateTime today = DateTime.now();
      DateTime next30Days = today.add(const Duration(days: 30));

      String todayString = DateFormat('yyyy-MM-dd').format(today);
      String next30DaysString = DateFormat('yyyy-MM-dd').format(next30Days);

      final response = await dio.get('/3/discover/movie', queryParameters: {
        'page': page,
        'sort_by': 'popularity.desc',
        'with_genres': genreId,
        'with_release_type': '2|3',
        'release_date.gte': todayString,
        'release_date.lte': next30DaysString,
      });

      if (response.statusCode == 200) {
        final List movies = response.data['results'];
        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch upcoming movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> searchMovies(String keyword, {int page = 1}) async {
    try {
      final response = await dio.get('/3/search/movie', queryParameters: {
        'page': page,
        'query': keyword,
      });

      if (response.statusCode == 200) {
        final List movies = response.data['results'];
        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch popular movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> fetchNowPlayingMovies(int page) async {
    try {
      final genreId = await MovieGenreStorageUtils.getGenresStr();
      DateTime today = DateTime.now();
      DateTime past7Days = today.subtract(const Duration(days: 14));

      String todayString = DateFormat('yyyy-MM-dd').format(today);
      String past7DaysString = DateFormat('yyyy-MM-dd').format(past7Days);

      final response = await dio.get('/3/movie/now_playing', queryParameters: {
        // final response = await dio.get('/3/discover/movie', queryParameters: {
        'page': page,
        'sort_by': 'popularity.desc',
        'with_genres': genreId,
        'with_release_type': '2|3',
        'release_date.gte': past7DaysString,
        'release_date.lte': todayString,
      });

      if (response.statusCode == 200) {
        final List movies = response.data['results'];
        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch now playing movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> fetchRecommendedMovies(movieId, {int page = 1}) async {
    try {
      final response = await dio.get(
        '/3/movie/$movieId/recommendations',
        queryParameters: {
          'language': 'en-US',
          'page': page,
        },
      );

      if (response.statusCode == 200) {
        final List movies = response.data['results'];
        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch recommended movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<MovieDetail> fetchMovieDetails(int movieId) async {
    try {
      final response = await dio.get(
        '/3/movie/$movieId',
        queryParameters: {
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        return MovieDetail.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch recommended movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Cast>> fetchMovieCaster(int movieId) async {
    try {
      final response = await dio.get(
        '/3/movie/$movieId/credits',
        queryParameters: {
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        final List cast = response.data['cast'];
        return cast.map((movie) => Cast.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch caster');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Genres>> fetchGenres() async {
    try {
      final response = await dio.get(
        '/3/genre/movie/list?language=en',
        queryParameters: {
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        final List data = response.data['genres'];
        return data.map((data) => Genres.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch recommended movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> fetchDiscover({int page = 1, int genres = 0}) async {
    try {
      final response = await dio.get(
        '/3/discover/movie',
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
          'with_genres': genres == 0 ? '' : genres
        },
      );

      if (response.statusCode == 200) {
        final List movies = response.data['results'];
        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch recommended movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
