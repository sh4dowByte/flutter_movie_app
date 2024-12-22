// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';
import 'package:flutter_movie_app/features/favorite/domain/repositories/movie_favorite_repository.dart';

class GetFavoriteMovies {
  final MovieFavoriteRepository _repository;

  GetFavoriteMovies(this._repository);

  Future<Either<Failure, List<Favorite>>> call() {
    return _repository.getFavoriteMovie();
  }
}
