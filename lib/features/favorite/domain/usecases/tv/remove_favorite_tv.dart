// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/favorite/domain/repositories/tv_favorite_repository.dart';

class RemoveFavoriteTv {
  final TvFavoriteRepository _repository;

  RemoveFavoriteTv(this._repository);

  Future<Either<Failure, bool>> call(int id) {
    return _repository.deleteFavoriteTv(id);
  }
}
