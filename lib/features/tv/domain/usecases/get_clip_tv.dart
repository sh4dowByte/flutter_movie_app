// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/core/data/models/movie_clip.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

class GetTvClips {
  final TvRepository _repository;

  GetTvClips(this._repository);

  Future<Either<Failure, List<MovieClip>>> call(
      int seriesId, int? sessionNumber, int? episodeNumber) {
    return _repository.getClipTv(seriesId, sessionNumber, episodeNumber);
  }
}
