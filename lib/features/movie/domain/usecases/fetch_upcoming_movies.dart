// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';

import '../../data/models/movie.dart';
import '../../data/repository/movie_repository.dart';

class FetchUpcomingMovies {
  final MovieRepository _repository;

  FetchUpcomingMovies(this._repository);

  Future<Either<Failure, List<Movie>>> call(int page) {
    return _repository.fetchUpcomingMovies(page);
  }
}
