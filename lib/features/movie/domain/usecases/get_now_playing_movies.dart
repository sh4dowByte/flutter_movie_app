// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';

import '../../data/models/movie.dart';

class GetNowPlayingMovies {
  final MovieRepository _repository;

  GetNowPlayingMovies(this._repository);

  Future<Either<Failure, List<Movie>>> call(int page) {
    return _repository.getNowPlayingMovies(page);
  }
}