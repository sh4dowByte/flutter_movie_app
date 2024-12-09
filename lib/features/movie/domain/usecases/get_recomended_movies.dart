// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';

import '../../data/models/movie.dart';

class GetRecomendedMovies {
  final MovieRepository _repository;

  GetRecomendedMovies(this._repository);

  Future<Either<Failure, List<Movie>>> call(int page, int movieId) {
    return _repository.getRecomendedMovies(page, movieId);
  }
}
