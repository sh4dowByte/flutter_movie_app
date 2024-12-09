import 'package:flutter_movie_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/features/movie/data/models/genres.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Genres>>> getGenreMovies();

  Future<Either<Failure, List<Movie>>> getUpcomingMovies(int page);
  Future<Either<Failure, List<Movie>>> getPopularMovies(int page);
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(int page);
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies(int page);

  Future<Either<Failure, List<Movie>>> getDiscoverMovies(int page, int genreId);
  Future<Either<Failure, List<Movie>>> getRecomendedMovies(
      int page, int movieId);
  Future<Either<Failure, List<Movie>>> getSearchMovies(
      int page, String keyword);
}
