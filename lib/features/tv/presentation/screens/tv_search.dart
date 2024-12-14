import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_search_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_search_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/widgets/app_tv_card.dart';
import 'package:flutter_movie_app/widget/app_error.dart';
import 'package:flutter_movie_app/widget/app_text_search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TvSearchPage extends ConsumerStatefulWidget {
  const TvSearchPage({super.key});

  @override
  ConsumerState<TvSearchPage> createState() => TvSearchPageState();
}

class TvSearchPageState extends ConsumerState<TvSearchPage> {
  final ScrollController _scrollControllerSearch = ScrollController();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchTvProvider.notifier).getInitial('');
    });

    _scrollControllerSearch.addListener(() {
      if (_scrollControllerSearch.position.pixels >=
          _scrollControllerSearch.position.maxScrollExtent) {
        ref.read(searchTvProvider.notifier).getNextPage();
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
    final searchTvState = ref.watch(searchTvProvider);

    return Scaffold(
      appBar: AppBar(
          title: // Search
              AppTextSearch(
        controller: _controller,
        onSubmitted: (text) {
          ref.read(searchTvProvider.notifier).getInitial(text);
        },
      )),
      body: searchTvState.when(
        data: (data) {
          return SizedBox(
            child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollControllerSearch,
                itemCount: data.length +
                    (ref.read(searchTvProvider.notifier).isLoadingNextPage
                        ? 1
                        : 0),
                itemBuilder: (context, index) {
                  if (index < data.length) {
                    final item = data[index];
                    return AppTvCoverTile(item: item);
                  } else {
                    return AppTvCoverTile.skeleton();
                  }
                }),
          );
        },
        loading: () => AppTvCoverTile.loading(),
        error: (error, stackTrace) => AppError(
          error as Failure,
          stackTrace: stackTrace,
        ),
      ),
    );
  }
}
