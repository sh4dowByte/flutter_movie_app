import 'package:flutter_movie_app/core/errors/failure.dart';

import '../models/movie.dart';
import '../services/movie_services.dart';
import 'package:dartz/dartz.dart';

class MovieRepository {
  final MovieService _movieService;

  MovieRepository(this._movieService);

  Future<Either<Failure, List<Movie>>> fetchUpcomingMovies(int page) async {
    try {
      final movies = await _movieService.fetchUpcomingMovies(page);
      if (movies.isEmpty) {
        return Left(EmptyDataFailure('No upcoming movies found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load upcoming movies.'));
    }
  }
}
