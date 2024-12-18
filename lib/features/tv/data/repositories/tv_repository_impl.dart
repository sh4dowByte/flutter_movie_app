import 'package:flutter_movie_app/core/data/models/movie_clip.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/core/data/models/genres.dart';
import 'package:flutter_movie_app/core/data/models/stills_images.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/people/data/models/tv_credits.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_detail.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_episode.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_seasons.dart';
import 'package:flutter_movie_app/features/tv/data/services/tv_services.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

import 'package:dartz/dartz.dart';

class TvRepositoryImpl implements TvRepository {
  final TVService _tvService;

  TvRepositoryImpl(this._tvService);

  @override
  Future<Either<Failure, List<Tv>>> getAiringTodayTv(int page) async {
    try {
      final movies = await _tvService.fetchAiringTodayTv(page);
      if (movies.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No airing tv today found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load upcoming movies.'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv(int page) async {
    try {
      final movies = await _tvService.fetchPopularTv(page);
      if (movies.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No popular tv found.'));
      }
      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load popular tv.'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv(int page) async {
    try {
      final tv = await _tvService.fetchTopRatedTv(page);
      if (tv.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No top rated tv found.'));
      }
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load top rated tv.'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getDiscoverTv(int page, int genreId) async {
    try {
      final tv = await _tvService.fetchDiscoverTv(page: page, genres: genreId);
      if (tv.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No discover tv found.'));
      }
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load discover tv.'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getSearchTv(
      int page, String keyword) async {
    try {
      if (keyword.isEmpty) {
        return Left(EmptyDataFailure('Search Tv'));
      }

      final tv = await _tvService.searchTv(keyword, page: page);
      if (tv.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No tv with keyword "$keyword" found.'));
      }
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load tv.'));
    }
  }

  @override
  Future<Either<Failure, List<Genres>>> getGenreTv() async {
    try {
      final genre = await _tvService.fetchGenres();

      if (genre.isEmpty) {
        return Left(EmptyDataFailure('No genres found.'));
      }
      return Right(genre);
    } catch (e) {
      return Left(NetworkFailure('Failed to load genres.'));
    }
  }

  @override
  Future<Either<Failure, TvDetail>> getTvDetail(int seriesId) async {
    try {
      final movies = await _tvService.fetchTvDetails(seriesId);

      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load detail tv series.'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getOnTheAirTv(int page) async {
    try {
      final tv = await _tvService.fetchOnTheAirTv(page);
      if (tv.isEmpty && page == 1) {
        return Left(EmptyDataFailure('No on the air tv found.'));
      }
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load on the air tv.'));
    }
  }

  @override
  Future<Either<Failure, TvSeason>> getTvSeasonsDetail(
      int seriesId, int sessionNumber) async {
    try {
      final tv = await _tvService.fetchTvSessions(seriesId, sessionNumber);
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load on the tv sessions.'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getRecomendedTv(
      int page, int seriesId) async {
    try {
      final tv = await _tvService.fetchRecomendedTv(seriesId, page: page);
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load on recomended tv.'));
    }
  }

  @override
  Future<Either<Failure, TvCredits>> getTvCredits(int seriesId) async {
    try {
      final tv = await _tvService.fetchCreditTv(seriesId);
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load credit tv.'));
    }
  }

  @override
  Future<Either<Failure, TvEpisode>> getTvEpisodeDetail(
      int seriesId, int sessionNumber, int episodeNumber) async {
    try {
      final tv = await _tvService.fetchTvEpisode(
          seriesId, sessionNumber, episodeNumber);
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load episode tv.'));
    }
  }

  @override
  Future<Either<Failure, List<StillsImage>>> getStillsImageEpisode(
      int seriesId, int sessionNumber, int episodeNumber) async {
    try {
      final tv = await _tvService.fetchStillsImage(
          seriesId, sessionNumber, episodeNumber);
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load stills image tv.'));
    }
  }

  @override
  Future<Either<Failure, List<MovieClip>>> getClipTv(
      int seriesId, int? sessionNumber, int? episodeNumber) async {
    try {
      final tv = await _tvService.fetchTvClip(seriesId,
          seasonNumber: sessionNumber, episodeNumber: episodeNumber);
      if (tv.isEmpty) {
        return Left(EmptyDataFailure('No on the tv clip found.'));
      }
      return Right(tv);
    } catch (e) {
      return Left(NetworkFailure('Failed to load tv clip.'));
    }
  }
}
