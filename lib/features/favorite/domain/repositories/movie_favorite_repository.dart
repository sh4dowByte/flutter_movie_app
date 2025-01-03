import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';

abstract class MovieFavoriteRepository {
  Future<Either<Failure, bool>> insertFavoriteMovie(Favorite movie);
  Future<Either<Failure, bool>> deleteFavoriteMovie(int id);
  Future<Either<Failure, List<Favorite>>> getFavoriteMovie();
}
