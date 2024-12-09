// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie_detail.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';

class GetDetailMovies {
  final MovieRepository _repository;

  GetDetailMovies(this._repository);

  Future<Either<Failure, MovieDetail>> call(int movieId) {
    return _repository.getMovieDetail(movieId);
  }
}
