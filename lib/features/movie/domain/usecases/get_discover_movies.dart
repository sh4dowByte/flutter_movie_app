// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';

import '../../data/models/movie.dart';

class GetDiscoverMovies {
  final MovieRepository _repository;

  GetDiscoverMovies(this._repository);

  Future<Either<Failure, List<Movie>>> call(int page, int genreId) {
    return _repository.getDiscoverMovies(page, genreId);
  }
}
