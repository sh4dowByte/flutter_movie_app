import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_seasons.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_detail_season_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/widgets/app_tv_episode_card.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/widget/app_skeleton.dart';

class TvSeasonDetailPage extends ConsumerStatefulWidget {
  const TvSeasonDetailPage(this.seriesId, this.seasonNumber, {super.key});
  final int seriesId;
  final int seasonNumber;

  @override
  ConsumerState<TvSeasonDetailPage> createState() => _TvSeasonDetailPageState();
}

class _TvSeasonDetailPageState extends ConsumerState<TvSeasonDetailPage> {
  // late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(detailTvSeasonProvider(widget.seriesId).notifier)
          .getInitial(widget.seriesId, widget.seasonNumber);
      // ref
      //     .read(recomendedMoviesProvider(widget.seriesId).notifier)
      //     .getInitialMovies(widget.seriesId);
    });
  }

  bool showReadme = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tvState = ref.watch(detailTvSeasonProvider(widget.seriesId));

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: tvState.when(
            data: (data) => TvSeasonDetailContent(
                  tv: data,
                  seriesId: widget.seriesId,
                ),
            error: (error, stackTrace) => AppError(
                  error as Failure,
                  stackTrace: stackTrace,
                ),
            loading: () => TvSeasonDetailContent.loading()),
      ),
    );
  }
}

class TvSeasonDetailContent extends ConsumerStatefulWidget {
  final TvSeason tv;
  final int seriesId;
  const TvSeasonDetailContent(
      {super.key, required this.tv, required this.seriesId});

  @override
  ConsumerState<TvSeasonDetailContent> createState() =>
      TvSeasonDetailContentState();

  static Widget loading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSkeleton(height: 40),
          const SizedBox(height: 10),
          const AppSkeleton(height: 40),
          const SizedBox(height: 10),
          const AppSkeleton(
            height: 30,
            width: 200,
          ),
          const SizedBox(height: 20),
          ...List.generate(6, (index) => index + 1).map((item) {
            return const Column(
              children: [
                AppSkeleton(height: 15),
                SizedBox(height: 5),
              ],
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TvSeasonDetailContentState extends ConsumerState<TvSeasonDetailContent> {
  final ScrollController _scrollControllerRecomended = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref
      //     .read(recomendedTvProvider(widget.tv.id).notifier)
      //     .getInitial(widget.tv.id);

      // ref
      //     .read(creditTvProvider(widget.tv.id).notifier)
      //     .getInitial(widget.tv.id);
    });

    _scrollControllerRecomended.addListener(() {
      if (_scrollControllerRecomended.position.pixels >=
          _scrollControllerRecomended.position.maxScrollExtent) {
        // ref.read(recomendedTvProvider(widget.tv.id).notifier).getNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final recomendedState = ref.watch(recomendedTvProvider(widget.tv.id));
    // final casterState = ref.watch(creditTvProvider(widget.tv.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.tv.name, style: const TextStyle(fontSize: 26)),
              const SizedBox(height: 10),
              Text(
                'Release Date: ${widget.tv.airDate}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 10),
              Text(widget.tv.overview),
            ],
          ),
        ),

        const SizedBox(height: 20),

        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.tv.episodes.length,
            physics:
                const NeverScrollableScrollPhysics(), // Menonaktifkan scroll
            itemBuilder: (context, index) {
              final item = widget.tv.episodes[index];

              return AppEpisodeCoverTile(
                item: item,
                seriesId: widget.seriesId,
              );
            }),

        // Text(widget.tv.lastEpisodeToAir?.name ?? 'null'),
        // Text(widget.tv.lastEpisodeToAir?.airDate ?? 'null'),

        // Text(widget.tv.nextEpisodeToAir?.name ?? 'nu;;'),
        // Text(widget.tv.nextEpisodeToAir?.airDate ?? 'null'),

        const SizedBox(height: 20),
        // Caster
        // Offstage(
        //   offstage: false,
        //   child: Padding(
        //     padding:
        //         const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
        //     child: const Text('Top Billed Cast'),
        //   ),
        // ),

        // casterState.when(
        //   data: (data) => data.cast.isNotEmpty
        //       ? SizedBox(
        //           height: 130,
        //           child: ListView.builder(
        //               shrinkWrap: true,
        //               itemCount: data.cast.length,
        //               scrollDirection: Axis.horizontal,
        //               itemBuilder: (context, index) {
        //                 final item = data.cast[index];

        //                 EdgeInsets margin = EdgeInsets.only(
        //                   left: index == 0 ? 11 : 4,
        //                   right: index == data.cast.length - 1 ? 11 : 4,
        //                 );

        //                 return AppCastImage(item: item, margin: margin);
        //               }),
        //         )
        //       : Container(),
        //   loading: () => AppCastImage.loading(),
        //   error: (error, stackTrace) => Center(child: Text('Error: $error')),
        // ),

        const SizedBox(height: 20),
      ],
    );
  }
}
