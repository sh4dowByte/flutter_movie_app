// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/people/data/models/actor.dart';
import 'package:flutter_movie_app/features/people/domain/repositories/people_repository.dart';

class GetActorTrending {
  final PeopleRepository _repository;

  GetActorTrending(this._repository);

  Future<Either<Failure, List<Actor>>> call(int page) {
    return _repository.getActorTrending(page);
  }
}
