import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';

abstract class TvFavoriteRepository {
  Future<Either<Failure, bool>> insertFavoriteTv(Favorite series);
  Future<Either<Failure, bool>> deleteFavoriteTv(int id);
  Future<Either<Failure, List<Favorite>>> getFavoriteTv();
}
