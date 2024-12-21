// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';
import 'package:flutter_movie_app/features/favorite/domain/repositories/tv_favorite_repository.dart';

class GetFavoriteTv {
  final TvFavoriteRepository _repository;

  GetFavoriteTv(this._repository);

  Future<Either<Failure, List<Favorite>>> call() {
    return _repository.getFavoriteTv();
  }
}
