import 'package:flutter_movie_app/core/data/models/movie_clip.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/data/models/genres.dart';
import 'package:flutter_movie_app/core/data/models/stills_images.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/people/data/models/tv_credits.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_detail.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_episode.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_seasons.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Genres>>> getGenreTv();
  Future<Either<Failure, TvDetail>> getTvDetail(int sesiesId);
  Future<Either<Failure, TvCredits>> getTvCredits(int sesiesId);
  Future<Either<Failure, TvSeason>> getTvSeasonsDetail(
      int seriesId, int sessionNumber);
  Future<Either<Failure, TvEpisode>> getTvEpisodeDetail(
      int seriesId, int sessionNumber, int episodeNumber);
  Future<Either<Failure, List<StillsImage>>> getStillsImageEpisode(
      int seriesId, int sessionNumber, int episodeNumber);

  Future<Either<Failure, List<MovieClip>>> getClipTv(
      int seriesId, int? sessionNumber, int? episodeNumber);

  Future<Either<Failure, List<Tv>>> getDiscoverTv(int page, int genreId);
  Future<Either<Failure, List<Tv>>> getAiringTodayTv(int page,
      {String? dateToday});
  Future<Either<Failure, List<Tv>>> getPopularTv(int page);
  Future<Either<Failure, List<Tv>>> getTopRatedTv(int page);
  Future<Either<Failure, List<Tv>>> getOnTheAirTv(int page);
  Future<Either<Failure, List<Tv>>> getRecomendedTv(int page, int seriesId);

  Future<Either<Failure, List<Tv>>> getSearchTv(int page, String keyword);
}
