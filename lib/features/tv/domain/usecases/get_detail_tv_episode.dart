// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_episode.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

class GetDetailTvEpisode {
  final TvRepository _repository;

  GetDetailTvEpisode(this._repository);

  Future<Either<Failure, TvEpisode>> call(
      int seriesId, int seasonNumber, int episodeNumber) {
    return _repository.getTvEpisodeDetail(
        seriesId, seasonNumber, episodeNumber);
  }
}
