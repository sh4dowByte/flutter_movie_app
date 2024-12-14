import 'package:flutter_movie_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/features/movie/data/models/genres.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_detail.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_seasons.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Genres>>> getGenreTv();
  Future<Either<Failure, TvDetail>> getTvDetail(int sesiesId);
  Future<Either<Failure, TvSeason>> getTvSeasons(
      int seriesId, int sessionNumber);

  Future<Either<Failure, List<Tv>>> getDiscoverTv(int page, int genreId);
  Future<Either<Failure, List<Tv>>> getAiringTodayTv(int page);
  Future<Either<Failure, List<Tv>>> getPopularTv(int page);
  Future<Either<Failure, List<Tv>>> getTopRatedTv(int page);
  Future<Either<Failure, List<Tv>>> getOnTheAirTv(int page);

  Future<Either<Failure, List<Tv>>> getSearchTv(int page, String keyword);
}
