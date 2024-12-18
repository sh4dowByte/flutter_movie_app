// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/core/data/models/movie_clip.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';

class GetMovieClips {
  final MovieRepository _repository;

  GetMovieClips(this._repository);

  Future<Either<Failure, List<MovieClip>>> call(int movieId) {
    return _repository.getMovieClips(movieId);
  }
}
