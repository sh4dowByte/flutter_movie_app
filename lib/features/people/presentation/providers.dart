import 'package:flutter_movie_app/features/people/data/repositories/people_repository_impl.dart';
import 'package:flutter_movie_app/features/people/data/services/people_services.dart';
import 'package:flutter_movie_app/features/people/domain/repositories/people_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final peopleServiceProvider = Provider((ref) => PeopleService());

final peopleRepositoryProvider = Provider<PeopleRepository>(
  (ref) => PeopleRepositoryImpl(ref.watch(peopleServiceProvider)),
);
