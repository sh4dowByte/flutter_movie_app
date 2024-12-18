// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/core/data/models/stills_images.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

class GetStillsImageTv {
  final TvRepository _repository;

  GetStillsImageTv(this._repository);

  Future<Either<Failure, List<StillsImage>>> call(
      int seriesId, int sessionNumber, int episodeNumber) {
    return _repository.getStillsImageEpisode(
        seriesId, sessionNumber, episodeNumber);
  }
}
