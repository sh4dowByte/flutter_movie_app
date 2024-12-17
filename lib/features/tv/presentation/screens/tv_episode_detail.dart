import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/pallete.dart';
import 'package:flutter_movie_app/core/utils/date_helper.dart';
import 'package:flutter_movie_app/core/utils/image_url_helper.dart';
import 'package:flutter_movie_app/core/widget/app_cast_image.dart';
import 'package:flutter_movie_app/core/widget/star_rating.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_episode.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_detail_episode_notifier.dart';
import 'package:flutter_movie_app/core/widget/app_circle_button.dart';
import 'package:flutter_movie_app/core/widget/app_error.dart';
import 'package:flutter_movie_app/features/tv/presentation/widgets/app_button_play_video.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widget/app_skeleton.dart';

class TvEpisodeDetailPage extends ConsumerStatefulWidget {
  const TvEpisodeDetailPage(
      this.seriesId, this.seasonNumber, this.epidoseNumber,
      {super.key});
  final int seriesId;
  final int seasonNumber;
  final int epidoseNumber;

  @override
  ConsumerState<TvEpisodeDetailPage> createState() =>
      _TvEpisodeDetailPageState();
}

class _TvEpisodeDetailPageState extends ConsumerState<TvEpisodeDetailPage> {
  // late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(detailTvEpisodeProvider(widget.seriesId).notifier).getInitial(
          widget.seriesId, widget.seasonNumber, widget.epidoseNumber);
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
    final tvState = ref.watch(detailTvEpisodeProvider(widget.seriesId));

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innnerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              titleSpacing: 0.0,
              centerTitle: false,
              elevation: 0.0,
              leadingWidth: 0.0,
              title: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppCircleButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: tvState.when(
                    data: (value) => Stack(
                      children: [
                        CachedNetworkImage(
                          height: double.infinity,
                          imageUrl: ImageUrlHelper.getBackdropUrl(
                              value.stillPath,
                              size: ImageSize.original),
                          errorWidget: (context, url, error) => Container(
                            color: Pallete.grey1,
                            child: Image.asset(
                              'assets/broken.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          placeholder: (context, string) {
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: ImageUrlHelper.getBackdropUrl(
                                      value.stillPath,
                                      size: ImageSize.w300),
                                  fit: BoxFit.cover,
                                ),
                                BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10.0, sigmaY: 10.0),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                        // Backdrop top
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter, // Awal gradien
                                end: Alignment.topCenter, // Akhir gradien
                                colors: [
                                  Theme.of(context)
                                      .scaffoldBackgroundColor
                                      .withOpacity(1),
                                  Theme.of(context)
                                      .scaffoldBackgroundColor
                                      .withOpacity(0.8),

                                  Colors.transparent, // Warna akhir
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadiusDirectional.circular(10),
                                child: CachedNetworkImage(
                                  height: 150,
                                  width: 100,
                                  imageUrl: ImageUrlHelper.getPosterUrl(
                                      value.stillPath,
                                      size: ImageSize.w500),
                                  fit: BoxFit.cover,
                                  placeholder: (context, string) {
                                    return const AppSkeleton();
                                  },
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Pallete.grey1,
                                    child: Image.asset(
                                      'assets/broken.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Episode ${value.episodeNumber}'),
                                    Row(
                                      children: [
                                        Text(
                                          DateHelper.formatNormalDate(
                                              value.airDate ?? ''),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    StarRating(rating: value.voteAverage!),
                                    const SizedBox(height: 9),
                                    AppButtonPlayVideo(seriesId: value.id),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    loading: () => const Text(''),
                    error: (error, stackTrace) => Container(),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Stack(
          children: [
            Builder(
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: tvState.when(
                      data: (data) => TvEpisodeDetailContent(
                            tv: data,
                          ),
                      error: (error, stackTrace) => AppError(
                            error as Failure,
                            stackTrace: stackTrace,
                          ),
                      loading: () => TvEpisodeDetailContent.loading()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TvEpisodeDetailContent extends ConsumerStatefulWidget {
  final TvEpisode tv;
  const TvEpisodeDetailContent({super.key, required this.tv});

  @override
  ConsumerState<TvEpisodeDetailContent> createState() =>
      TvEpisodeDetailContentState();

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

class TvEpisodeDetailContentState
    extends ConsumerState<TvEpisodeDetailContent> {
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
              Text(widget.tv.overview!),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Offstage(
          offstage: widget.tv.guestStars.isEmpty,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
            child: const Text('Guest Star'),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.tv.guestStars.length,
              itemBuilder: (context, index) {
                final item = widget.tv.guestStars[index];

                return AppCastImage(
                  actorId: item.id,
                  image: item.profilePath!,
                  name: item.name,
                  character: item.character,
                );
              }),
        ),
        const SizedBox(height: 20),
        Offstage(
          offstage: widget.tv.crew.isEmpty,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
            child: const Text('Crew'),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.tv.crew.length,
              itemBuilder: (context, index) {
                final item = widget.tv.crew[index];

                return AppCastImage(
                  actorId: item.id,
                  image: item.profilePath ?? '',
                  name: item.name,
                  character: item.job,
                );
              }),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}