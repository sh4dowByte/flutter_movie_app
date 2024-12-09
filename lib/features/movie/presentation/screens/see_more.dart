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
  final TextEditingController _controller = TextEditingController();

  StateNotifierProvider provider = discoverMoviesProvider;

  @override
  void initState() {
    super.initState();

    if (widget.providerKey == 'popular') {
      provider = popularMoviesProvider;
    } else if (widget.providerKey == 'discover') {
      provider = discoverMoviesProvider;
    } else if (widget.providerKey == 'upcoming') {
      provider = upcomingMoviesProvider;
    } else if (widget.providerKey == 'top_rated') {
      provider = topRatedMoviesProvider;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {});
    _scrollControllerSearch.addListener(() {
      if (_scrollControllerSearch.position.pixels >=
          _scrollControllerSearch.position.maxScrollExtent) {
        if (widget.providerKey == 'popular') {
          ref.read(popularMoviesProvider.notifier).getNextPage();
        } else if (widget.providerKey == 'top_rated') {
          ref.read(topRatedMoviesProvider.notifier).getNextPage();
        } else if (widget.providerKey == 'upcoming') {
          ref.read(upcomingMoviesProvider.notifier).getNextPage();
        } else if (widget.providerKey == 'discover') {
          ref.read(discoverMoviesProvider.notifier).getNextPage();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollControllerSearch.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Movie>> state;
    state = ref.watch(provider as ProviderListenable<AsyncValue<List<Movie>>>);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: state.when(
        data: (data) => SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
              controller: _scrollControllerSearch,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return AppMovieCoverTile(item: item);
              }),
        ),
        loading: () => AppMovieCoverTile.loading(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
