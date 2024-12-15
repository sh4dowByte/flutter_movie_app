import 'package:flutter_movie_app/core/data/services/tmdb_services.dart';
import 'package:flutter_movie_app/features/people/data/models/actor.dart';
import 'package:flutter_movie_app/features/people/data/models/cast.dart';
import 'package:flutter_movie_app/core/data/models/genres.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie_clip.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie_detail.dart';
import '../models/movie.dart';

class MovieService extends TMDBService {
  MovieService(super.ref);

  Future<List<Movie>> fetchPopularMovies(int page) async {
    try {
      final response = await dio.get('/3/movie/popular', queryParameters: {
        'language': 'en-US',
        'page': page,
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
      final response = await dio.get('/3/movie/top_rated', queryParameters: {
        'language': 'en-US',
        'page': page,
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
      final response = await dio.get('/3/movie/upcoming', queryParameters: {
        'language': 'en-US',
        'page': page,
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
      final response = await dio.get('/3/movie/now_playing', queryParameters: {
        'language': 'en-US',
        'page': page,
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

  Future<Actor> fetchActorDetail(int personId) async {
    try {
      final response = await dio.get(
        '/3/person/$personId',
        queryParameters: {
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        return Actor.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch actor');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> fetchActorMovies(int personId) async {
    try {
      final response = await dio.get(
        '/3/person/$personId/movie_credits',
        queryParameters: {
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        final List movies = response.data['cast'];
        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch actor movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
