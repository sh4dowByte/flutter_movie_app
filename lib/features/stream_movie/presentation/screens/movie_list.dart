import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/stream_movie/presentation/notifiers/slug.dart';
import 'package:flutter_movie_app/features/stream_movie/presentation/widgets/app_stream_link.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieList extends ConsumerStatefulWidget {
  final String movieTitle;
  const MovieList({super.key, required this.movieTitle});

  @override
  ConsumerState<MovieList> createState() => _MovieListState();
}

class _MovieListState extends ConsumerState<MovieList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(movieStreamProvider.notifier).getSlug(widget.movieTitle);
    });
  }

  @override
  Widget build(BuildContext context) {
    final streamState = ref.watch(movieStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieTitle),
      ),
      body: ListView(
        children: [
          // Caster
          streamState.when(
            data: (data) => data.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final item = data[index];

                              return AppStreamLink(item: item);
                            }),
                      ),
                    ],
                  )
                : Container(),
            loading: () => AppStreamLink.loading(),
            error: (error, stackTrace) => Center(child: Text('$error')),
          ),
        ],
      ),
    );
  }
}
