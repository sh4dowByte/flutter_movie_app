// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_movie_app/features/people/domain/repositories/people_repository.dart';

class GetActorMovies {
  final PeopleRepository _repository;

  GetActorMovies(this._repository);

  Future<Either<Failure, List<Movie>>> call(int personId) {
    return _repository.getActorMovies(personId);
  }
}
