import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';
import 'package:flutter_movie_app/features/favorite/data/services/db_services.dart';
import 'package:flutter_movie_app/features/favorite/domain/repositories/tv_favorite_repository.dart';

import 'package:dartz/dartz.dart';

class TvFavoriteRepositoryImpl implements TvFavoriteRepository {
  final DBService _dbService;

  TvFavoriteRepositoryImpl(this._dbService);

  @override
  Future<Either<Failure, bool>> insertFavoriteTv(Favorite fav) async {
    try {
      final status = await _dbService.insertFavorite(fav);
      if (status <= 0) {
        return Left(DBInsertFailed('Failed to insert favorite series.'));
      }
      return const Right(true);
    } catch (e) {
      return Left(DBFailure('Database error during insert: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavoriteTv(int id) async {
    try {
      final status = await _dbService.deleteFavoriteSeries(id);
      if (status <= 0) {
        return Left(DBDeleteFailed('Failed to delete favorite series.'));
      }
      return const Right(true);
    } catch (e) {
      return Left(DBFailure('Database error during delete: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Favorite>>> getFavoriteTv() async {
    try {
      final series = await _dbService.getFavoriteSeries();
      if (series.isEmpty) {
        return Left(EmptyDataFailure('No favorite series found.'));
      }
      return Right(series);
    } catch (e) {
      return Left(
          DBFailure('Database error during retrieval: ${e.toString()}'));
    }
  }
}
