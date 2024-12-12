import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/movie/data/models/actor.dart';
import 'package:flutter_movie_app/features/movie/data/models/genres.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie_detail.dart';

import '../../domain/repositories/movie_repository.dart';
import '../models/movie.dart';
import '../services/movie_services.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieService _movieService;

  MovieRepositoryImpl(this._movieService);

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies(int page) async {
    try {
      final movies = await _movieService.fetchUpcomingMovies(page);
      if (movies.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No upcoming movies found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load upcoming movies.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies(int page) async {
    try {
      final movies = await _movieService.fetchPopularMovies(page);
      if (movies.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No popular movies found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load popular movies.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(int page) async {
    try {
      final movies = await _movieService.fetchTopRatedMovies(page);
      if (movies.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No top rated movies found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load top rated movies.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies(int page) async {
    try {
      final movies = await _movieService.fetchNowPlayingMovies(page);
      if (movies.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No now playing movies found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load now playing movies.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getDiscoverMovies(
      int page, int genreId) async {
    try {
      final movies =
          await _movieService.fetchDiscover(page: page, genres: genreId);
      if (movies.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No discover movies found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load discover movies.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSearchMovies(
      int page, String keyword) async {
    try {
      if (keyword.isEmpty) {
        return Left(EmptyDataFailure('Search movie'));
      }

      final movies = await _movieService.searchMovies(keyword, page: page);
      if (movies.isEmpty && page == 1) {
        return Left(
            EmptyDataFailure('No movies with keyword "$keyword" found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load movies.'));
    }
  }

  @override
  Future<Either<Failure, List<Genres>>> getGenreMovies() async {
    try {
      final genre = await _movieService.fetchGenres();

      if (genre.isEmpty) {
        return Left(EmptyDataFailure('No genres found.'));
      }
      return Right(genre);
    } catch (e) {
      return Left(NetworkFailure('Failed to load genres.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getRecomendedMovies(
      int page, int movieId) async {
    try {
      final movies =
          await _movieService.fetchRecommendedMovies(movieId, page: page);

      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load recomended movie.'));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(int movieId) async {
    try {
      final movies = await _movieService.fetchMovieDetails(movieId);

      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load detail movie.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getActorMovies(int personId) async {
    try {
      final movies = await _movieService.fetchActorMovies(personId);

      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load actor movie.'));
    }
  }

  @override
  Future<Either<Failure, Actor>> getActorDetail(int personId) async {
    try {
      final movies = await _movieService.fetchActorDetail(personId);

      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
