import 'package:flutter_movie_app/features/movie/data/services/movie_services.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MovieRepository,
  MovieService,
  IOClient,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
