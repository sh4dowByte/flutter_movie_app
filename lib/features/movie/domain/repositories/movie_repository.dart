import 'package:flutter_movie_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/features/people/data/models/actor.dart';
import 'package:flutter_movie_app/core/data/models/genres.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie_clip.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie_detail.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Genres>>> getGenreMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetail(int movieId);
  Future<Either<Failure, List<MovieClip>>> getMovieClips(int movieId);

  Future<Either<Failure, List<Movie>>> getUpcomingMovies(int page);
  Future<Either<Failure, List<Movie>>> getPopularMovies(int page);
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(int page);
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies(int page);

  Future<Either<Failure, List<Movie>>> getDiscoverMovies(int page, int genreId);
  Future<Either<Failure, List<Movie>>> getRecomendedMovies(
      int page, int movieId);
  Future<Either<Failure, List<Movie>>> getSearchMovies(
      int page, String keyword);

  Future<Either<Failure, Actor>> getActorDetail(int personId);
  Future<Either<Failure, List<Movie>>> getActorMovies(int personId);
}
