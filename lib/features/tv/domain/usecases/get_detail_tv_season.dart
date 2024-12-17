// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_seasons.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

class GetDetailTvSeason {
  final TvRepository _repository;

  GetDetailTvSeason(this._repository);

  Future<Either<Failure, TvSeason>> call(int seriesId, int seasonNumber) {
    return _repository.getTvSeasonsDetail(seriesId, seasonNumber);
  }
}
