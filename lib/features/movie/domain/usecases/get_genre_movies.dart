// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/core/data/models/genres.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';

class GetGenreMovies {
  final MovieRepository _repository;

  GetGenreMovies(this._repository);

  Future<Either<Failure, List<Genres>>> call() {
    return _repository.getGenreMovies();
  }
}
