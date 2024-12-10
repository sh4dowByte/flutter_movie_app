import 'package:flutter_movie_app/features/movie/data/services/movie_services.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MovieRepository,
  MovieService,
])
void main() {}
