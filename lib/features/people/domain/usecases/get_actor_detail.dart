// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/people/data/models/actor.dart';
import 'package:flutter_movie_app/features/people/domain/repositories/people_repository.dart';

class GetActorDetail {
  final PeopleRepository _repository;

  GetActorDetail(this._repository);

  Future<Either<Failure, Actor>> call(int personId) {
    return _repository.getActorDetail(personId);
  }
}
