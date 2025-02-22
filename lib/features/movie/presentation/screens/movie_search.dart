import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_search_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/widgets/app_movie_card.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_error.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_text_search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieSearchPage extends ConsumerStatefulWidget {
  const MovieSearchPage({super.key});

  @override
  ConsumerState<MovieSearchPage> createState() => MovieSearchPageState();
}

class MovieSearchPageState extends ConsumerState<MovieSearchPage> {
  final ScrollController _scrollControllerSearch = ScrollController();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchMoviesProvider.notifier).getInitialMovies('');
    });

    _scrollControllerSearch.addListener(() {
      if (_scrollControllerSearch.position.pixels >=
          _scrollControllerSearch.position.maxScrollExtent) {
        ref.read(searchMoviesProvider.notifier).getNextPage();
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
    final searchMovieState = ref.watch(searchMoviesProvider);

    return Scaffold(
      appBar: AppBar(
          title: // Search
              AppTextSearch(
        controller: _controller,
        onSubmitted: (text) {
          ref.read(searchMoviesProvider.notifier).getInitialMovies(text);
        },
      )),
      body: searchMovieState.when(
        data: (data) {
          return SizedBox(
            child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollControllerSearch,
                itemCount: data.length +
                    (ref.read(searchMoviesProvider.notifier).isLoadingNextPage
                        ? 1
                        : 0),
                itemBuilder: (context, index) {
                  if (index < data.length) {
                    final item = data[index];
                    return AppMovieCoverTile(item: item);
                  } else {
                    return AppMovieCoverTile.skeleton();
                  }
                }),
          );
        },
        loading: () => AppMovieCoverTile.loading(),
        error: (error, stackTrace) => AppError(
          error as Failure,
          stackTrace: stackTrace,
        ),
      ),
    );
  }
}
