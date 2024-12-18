import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/favorite/data/services/db_services.dart';
import 'package:flutter_movie_app/features/favorite/domain/repositories/movie_favorite_repository.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_error.dart';

class MovieFavoriteRepositoryImpl implements MovieFavoriteRepository {
  final DBService _dbService;

  MovieFavoriteRepositoryImpl(this._dbService);

  @override
  Future<Either<Failure, bool>> insertFavoriteMovie(Movie movie) async {
    try {
      final status = await _dbService.insertFavoriteMovie(movie);
      if (status != 1) {
        return Left(DBInsertFailed('Error insert favorite'));
      }
      return const Right(true);
    } catch (e) {
      return Left(NetworkFailure('Unknown error db'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavoriteMovie(int id) async {
    try {
      final status = await _dbService.deleteFavoriteMovie(id);
      if (status != 1) {
        return Left(DBInsertFailed('Error remove favorite'));
      }
      return const Right(true);
    } catch (e) {
      return Left(NetworkFailure('Unknown error db'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getFavoriteMovie() async {
    try {
      final movie = await _dbService.getFavoriteMovie();
      if (movie.isEmpty) {
        return Left(EmptyDataFailure('Empty favorite movies.'));
      }
      return Right(movie);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
