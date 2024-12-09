import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_discover_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_popular_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_top_rated_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/widgets/app_movie_card.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_upcoming_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeMorePage extends ConsumerStatefulWidget {
  final int? genreId;
  final String providerKey;
  final String title;
  const SeeMorePage(this.title, this.providerKey, {this.genreId, super.key});

  @override
  ConsumerState<SeeMorePage> createState() => SeeMorePageState();
}

class SeeMorePageState extends ConsumerState<SeeMorePage> {
  final ScrollController _scrollControllerSearch = ScrollController();

  late final StateNotifierProvider<dynamic, AsyncValue<List<Movie>>> provider;

  @override
  void initState() {
    super.initState();

    // Tetapkan provider berdasarkan `providerKey`
    switch (widget.providerKey) {
      case 'popular':
        provider = popularMoviesProvider;
        break;
      case 'discover':
        provider = discoverMoviesProvider;
        break;
      case 'upcoming':
        provider = upcomingMoviesProvider;
        break;
      case 'top_rated':
        provider = topRatedMoviesProvider;
        break;
      default:
        throw Exception('Invalid providerKey: ${widget.providerKey}');
    }

    // Setup listener untuk pagination
    _scrollControllerSearch.addListener(() {
      if (_scrollControllerSearch.position.pixels >=
          _scrollControllerSearch.position.maxScrollExtent) {
        ref.read(provider.notifier).getNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollControllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: state.when(
        data: (data) => SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            controller: _scrollControllerSearch,
            itemCount: data.length +
                (ref.read(provider.notifier).isLoadingNextPage ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < data.length) {
                final item = data[index];
                return AppMovieCoverTile(item: item);
              } else {
                return AppMovieCoverTile.skeleton();
              }
            },
          ),
        ),
        loading: () => AppMovieCoverTile.loading(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
