import 'package:flutter_movie_app/core/data/services/tmdb_services.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_movie_app/features/people/data/models/actor.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';

class PeopleService extends TMDBService {
  PeopleService();

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

  Future<List<Actor>> fetchActorTrending(int page) async {
    try {
      final response =
          await dio.get('/3/trending/person/day', queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        final List actor = response.data['results'];
        return actor.map((actors) => Actor.fromJson(actors)).toList();
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

  Future<List<Tv>> fetchActorTv(int personId) async {
    try {
      final response = await dio.get(
        '/3/person/$personId/tv_credits',
        queryParameters: {
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        final List movies = response.data['cast'];
        return movies.map((movie) => Tv.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to fetch actor movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
