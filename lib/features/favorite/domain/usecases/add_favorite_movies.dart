// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/favorite/domain/repositories/movie_favorite_repository.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';

class AddFavoriteMovies {
  final MovieFavoriteRepository _repository;

  AddFavoriteMovies(this._repository);

  Future<Either<Failure, bool>> call(Movie movie) {
    return _repository.insertFavoriteMovie(movie);
  }
}
