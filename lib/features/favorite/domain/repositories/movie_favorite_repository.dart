import 'package:flutter_movie_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';

abstract class MovieFavoriteRepository {
  Future<Either<Failure, bool>> insertFavoriteMovie(Movie movie);
  Future<Either<Failure, bool>> deleteFavoriteMovie(int id);
  Future<Either<Failure, List<Movie>>> getFavoriteMovie();
}
