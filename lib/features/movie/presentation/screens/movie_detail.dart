import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/pallete.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_circle_button.dart';
import 'package:flutter_movie_app/core/utils/date_helper.dart';
import 'package:flutter_movie_app/core/utils/image_url_helper.dart';
import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';
import 'package:flutter_movie_app/features/favorite/presentation/notifiers/movie_favorite_notifier.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie_detail.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_detail_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_recomended_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_caster.dart';
import 'package:flutter_movie_app/features/movie/presentation/widgets/app_button_play_trailer.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/presentation/widget/app_skeleton.dart';
import '../../../../core/presentation/widget/app_cast_image.dart';
import '../widgets/app_movie_card.dart';
import '../../../../core/presentation/widget/star_rating.dart';

class MovieDetailPage extends ConsumerStatefulWidget {
  const MovieDetailPage(this.movieId, {super.key});
  final int movieId;

  @override
  ConsumerState<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends ConsumerState<MovieDetailPage> {
  // late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(detailMoviesProvider(widget.movieId).notifier)
          .getInitial(widget.movieId);
      ref
          .read(recomendedMoviesProvider(widget.movieId).notifier)
          .getInitialMovies(widget.movieId);
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
    final movieState = ref.watch(detailMoviesProvider(widget.movieId));

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
                    const SizedBox(width: 15),
                    AppCircleButton(
                      icon: const Icon(
                        Icons.close,
                      ),
                      onTap: () => Navigator.popUntil(
                        context,
                        (route) =>
                            route.isFirst, // Kembali hingga halaman pertama
                      ),
                    ),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: movieState.when(
                    data: (value) => Stack(
                      children: [
                        CachedNetworkImage(
                          height: double.infinity,
                          imageUrl: ImageUrlHelper.getBackdropUrl(
                              value.backdropPath,
                              size: ImageSize.backdropOriginal),
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
                                      value.backdropPath,
                                      size: ImageSize.backdropW300),
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
                                      value.posterPath,
                                      size: ImageSize.posterW342),
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
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            value.genres
                                                .map((e) => e.name.toString())
                                                .join(', '),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        if (value.adult) ...[
                                          CachedNetworkImage(
                                              width: 28,
                                              height: 28,
                                              imageUrl:
                                                  'https://img.icons8.com/?size=480&id=o3iN2IEeyqAq&format=png'),
                                        ],
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${DateHelper.toYear(value.releaseDate)} ⦿ ${DateHelper.formatRuntime(value.runtime)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    StarRating(rating: value.voteAverage),
                                    const SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppButtonPlayTrailer(movieId: value.id),
                                        InkWell(
                                          onTap: () {
                                            ref
                                                .read(favoriteMoviesProvider
                                                    .notifier)
                                                .toggleFavoriteMovie(
                                                    Favorite.fromMapMovie(
                                                        value.toJson()));
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: ref
                                                    .watch(
                                                        favoriteMoviesProvider)
                                                    .maybeWhen(
                                                      data: (movies) =>
                                                          movies.any((movie) =>
                                                              movie.id ==
                                                              value.id),
                                                      orElse: () => false,
                                                    )
                                                ? Colors.pink
                                                : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Center(
                        //   child: YoutubePlayer(
                        //     controller: _controller,
                        //     showVideoProgressIndicator:
                        //         true, // Menampilkan progress bar video
                        //   ),
                        // ),
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
                  child: movieState.when(
                      data: (data) => MovieDetailContent(movie: data),
                      error: (error, stackTrace) => AppError(
                            error as Failure,
                            stackTrace: stackTrace,
                          ),
                      loading: () => MovieDetailContent.loading()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailContent extends ConsumerStatefulWidget {
  final MovieDetail movie;
  const MovieDetailContent({super.key, required this.movie});

  @override
  ConsumerState<MovieDetailContent> createState() => _MovieDetailContentState();

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
          AppCastImage.loading(),
          const SizedBox(height: 20),
          AppMovieCoverBox.loading()
        ],
      ),
    );
  }
}

class _MovieDetailContentState extends ConsumerState<MovieDetailContent> {
  final ScrollController _scrollControllerRecomended = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(movieCasterProvider(widget.movie.id).notifier)
          .fetchMovieCaster(widget.movie.id);
    });

    _scrollControllerRecomended.addListener(() {
      if (_scrollControllerRecomended.position.pixels >=
          _scrollControllerRecomended.position.maxScrollExtent) {
        ref
            .read(recomendedMoviesProvider(widget.movie.id).notifier)
            .getNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final recomendedState =
        ref.watch(recomendedMoviesProvider(widget.movie.id));
    final casterState = ref.watch(movieCasterProvider(widget.movie.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.movie.title, style: const TextStyle(fontSize: 26)),
              const SizedBox(height: 10),
              Text(
                'Release Date: ${widget.movie.releaseDate}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 10),
              Text(widget.movie.overview),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Caster
        casterState.when(
          data: (data) => data.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16)
                          .copyWith(bottom: 16),
                      child: const Text('Top Billed Cast'),
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = data[index];

                            EdgeInsets margin = EdgeInsets.only(
                              left: index == 0 ? 11 : 4,
                              right: index == data.length - 1 ? 11 : 4,
                            );

                            return AppCastImage(
                              margin: margin,
                              actorId: item.id,
                              image: item.profilePath,
                              name: item.name,
                              character: item.character!,
                            );
                          }),
                    ),
                  ],
                )
              : Container(),
          loading: () => AppCastImage.loading(),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),

        const SizedBox(height: 20),

        // Recomended
        recomendedState.when(
          data: (data) => data.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16)
                          .copyWith(bottom: 16),
                      child: const Text('Recomended'),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller: _scrollControllerRecomended,
                          itemCount: data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = data[index];

                            EdgeInsets margin = EdgeInsets.only(
                              left: index == 0 ? 20 : 4,
                              right: index == data.length - 1 ? 20 : 4,
                            );

                            return AppMovieCoverBox(
                              item: item,
                              margin: margin,
                              // replaceRoute: true,
                            );
                          }),
                    ),
                  ],
                )
              : Container(),
          loading: () => AppMovieCoverBox.loading(),
          error: (error, _) => Center(child: Text('Error: $error')),
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
