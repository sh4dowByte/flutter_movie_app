import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';
import 'package:flutter_movie_app/features/favorite/data/services/db_services.dart';
import 'package:flutter_movie_app/features/favorite/domain/repositories/movie_favorite_repository.dart';

import 'package:dartz/dartz.dart';

class MovieFavoriteRepositoryImpl implements MovieFavoriteRepository {
  final DBService _dbService;

  MovieFavoriteRepositoryImpl(this._dbService);

  @override
  Future<Either<Failure, bool>> insertFavoriteMovie(Favorite fav) async {
    try {
      final status = await _dbService.insertFavorite(fav);
      if (status <= 0) {
        return Left(DBInsertFailed('Failed to insert favorite movie.'));
      }
      return const Right(true);
    } catch (e) {
      return Left(DBFailure('Database error during insert: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavoriteMovie(int id) async {
    try {
      final status = await _dbService.deleteFavoriteMovie(id);
      if (status <= 0) {
        return Left(DBDeleteFailed('Failed to delete favorite movie.'));
      }
      return const Right(true);
    } catch (e) {
      return Left(DBFailure('Database error during delete: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Favorite>>> getFavoriteMovie() async {
    try {
      final movies = await _dbService.getFavoriteMovie();
      if (movies.isEmpty) {
        return Left(EmptyDataFailure('No favorite movies found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(
          DBFailure('Database error during retrieval: ${e.toString()}'));
    }
  }
}
