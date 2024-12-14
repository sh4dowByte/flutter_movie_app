import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_discover_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_genre_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_now_playing_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_popular_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_top_rated_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_upcoming_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_discover_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_genre_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/widgets/app_image_slider.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/language_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_airing_today_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/widgets/app_tv_card.dart';
import 'package:flutter_movie_app/widget/widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/routes.dart';

class TvPage extends ConsumerStatefulWidget {
  const TvPage({super.key});

  @override
  ConsumerState<TvPage> createState() => _TvPageState();
}

class _TvPageState extends ConsumerState<TvPage> {
  final ScrollController _scrollControllerPopular = ScrollController();
  final ScrollController _scrollControllerDiscover = ScrollController();
  final ScrollController _scrollControllerTopRated = ScrollController();
  final ScrollController _scrollControllerUpcoming = ScrollController();
  int genreId = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initData();
    });

    _scrollControllerDiscover.addListener(() {
      if (_scrollControllerDiscover.position.pixels >=
          _scrollControllerDiscover.position.maxScrollExtent) {
        ref.read(discoverTvProvider.notifier).getNextPage();
      }
    });

    _scrollControllerPopular.addListener(() {
      if (_scrollControllerPopular.position.pixels >=
          _scrollControllerPopular.position.maxScrollExtent) {
        ref.read(popularMoviesProvider.notifier).getNextPage();
      }
    });

    _scrollControllerTopRated.addListener(() {
      if (_scrollControllerTopRated.position.pixels >=
          _scrollControllerTopRated.position.maxScrollExtent) {
        ref.read(topRatedMoviesProvider.notifier).getNextPage();
      }
    });

    _scrollControllerUpcoming.addListener(() {
      if (_scrollControllerUpcoming.position.pixels >=
          _scrollControllerUpcoming.position.maxScrollExtent) {
        ref.read(upcomingMoviesProvider.notifier).getNextPage();
      }
    });
  }

  void initData() {
    // ref
    //     .read(discoverMoviesProvider.notifier)
    //     .getInitialMovies(genreId: genreId);
    // ref.read(nowPlayingMoviesProvider.notifier).getInitialMovies();
    // ref.read(popularMoviesProvider.notifier).getInitialMovies();
    // ref.read(topRatedMoviesProvider.notifier).getInitialMovies();
    // ref.read(upcomingMoviesProvider.notifier).getInitialMovies();

    ref.read(genreTvProvider.notifier).getInitial();
    ref.read(airingTvTodayProvider.notifier).getInitial();
    ref.read(discoverTvProvider.notifier).getInitial();
  }

  @override
  void dispose() {
    _scrollControllerDiscover.dispose();
    _scrollControllerPopular.dispose();
    _scrollControllerTopRated.dispose();
    _scrollControllerUpcoming.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieStateNowPlaying = ref.watch(nowPlayingMoviesProvider);
    final movieStatePopular = ref.watch(popularMoviesProvider);
    final genresState = ref.watch(genreMoviesProvider);
    final topRatedMovieState = ref.watch(topRatedMoviesProvider);
    final upcomingMovieState = ref.watch(upcomingMoviesProvider);

    final discoverTvState = ref.watch(discoverTvProvider);
    final airingTodayStateState = ref.watch(airingTvTodayProvider);

    // Listen perubahan bahasa
    ref.listen<String>(languageProvider, (previous, next) {
      if (previous != next) {
        initData();
      }
    });

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          // Now Playing
          airingTodayStateState.when(
            loading: () => AppImageSlider.loading(),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
            data: (data) => SizedBox(
              height: 362,
              child: AppImageSlider(
                tv: data,
                onSeeMore: () {
                  Navigator.pushNamed(context, Routes.seeMore, arguments: {
                    'title': 'Now Playing',
                    'providerKey': 'now_playing'
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 20),
          // Search
          InkWell(
            hoverColor: Colors.transparent, // Hapus efek hover
            onTap: () => Navigator.pushNamed(context, Routes.movieSearch),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 11),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 64,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Theme.of(context).hintColor,
                  ),
                  const SizedBox(width: 18),
                  Text(
                    'Search...',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 23),

          // Genres
          genresState.when(
            loading: () => AppSelectItemSmall.loading(),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
            data: (data) => AppSelectItemSmall(
              onChange: (id) {
                ref.read(discoverTvProvider.notifier).getInitial(genreId: id);

                genreId = id;
              },
              item: [
                const {
                  'id': 0,
                  'name': 'All',
                },
                ...data.map((e) => e.toJson())
              ],
            ),
          ),

          const SizedBox(height: 23),

          // Discover
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Discover'),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.seeMore,
                      arguments: {
                        'title': 'Discover',
                        'genreId': genreId,
                        'providerKey': 'discover'
                      }),
                  child: Text(
                    'See More',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),

          discoverTvState.when(
            data: (data) => SizedBox(
              height: 220,
              child: ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollControllerDiscover,
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = data[index];

                    EdgeInsets margin = EdgeInsets.only(
                      left: index == 0 ? 11 : 4,
                      right: index == data.length - 1 ? 11 : 4,
                    );

                    return AppTvCoverBox(item: item, margin: margin);
                  }),
            ),
            loading: () => AppTvCoverBox.loading(),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          ),

          const SizedBox(height: 23),

          // Popular
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text('Popular Movies'),
          //       InkWell(
          //         onTap: () => Navigator.pushNamed(context, Routes.seeMore,
          //             arguments: {
          //               'title': 'Popular Movies',
          //               'providerKey': 'popular'
          //             }),
          //         child: Text(
          //           'See More',
          //           style: Theme.of(context).textTheme.bodySmall,
          //         ),
          //       )
          //     ],
          //   ),
          // ),

          // movieStatePopular.when(
          //   data: (data) => SizedBox(
          //     height: 220,
          //     child: ListView.builder(
          //         shrinkWrap: true,
          //         controller: _scrollControllerPopular,
          //         itemCount: data.length,
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) {
          //           final item = data[index];

          //           EdgeInsets margin = EdgeInsets.only(
          //             left: index == 0 ? 11 : 4,
          //             right: index == data.length - 1 ? 11 : 4,
          //           );

          //           return AppMovieCoverBox(item: item, margin: margin);
          //         }),
          //   ),
          //   loading: () => AppMovieCoverBox.loading(),
          //   error: (error, stackTrace) => Center(child: Text('Error: $error')),
          // ),

          const SizedBox(height: 23),

          // Top Rated
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text('Top Rated Movies'),
          //       InkWell(
          //         onTap: () => Navigator.pushNamed(context, Routes.seeMore,
          //             arguments: {
          //               'title': 'Top Rated Movies',
          //               'providerKey': 'top_rated'
          //             }),
          //         child: Text(
          //           'See More',
          //           style: Theme.of(context).textTheme.bodySmall,
          //         ),
          //       )
          //     ],
          //   ),
          // ),

          // topRatedMovieState.when(
          //   data: (data) => SizedBox(
          //     height: 220,
          //     child: ListView.builder(
          //         shrinkWrap: true,
          //         controller: _scrollControllerTopRated,
          //         itemCount: data.length,
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) {
          //           final item = data[index];

          //           EdgeInsets margin = EdgeInsets.only(
          //             left: index == 0 ? 11 : 4,
          //             right: index == data.length - 1 ? 11 : 4,
          //           );

          //           return AppMovieCoverBox(item: item, margin: margin);
          //         }),
          //   ),
          //   loading: () => AppMovieCoverBox.loading(),
          //   error: (error, stackTrace) => Center(child: Text('Error: $error')),
          // ),

          const SizedBox(height: 23),

          // Upcoming
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text('Upcoming Movies'),
          //       InkWell(
          //         onTap: () => Navigator.pushNamed(context, Routes.seeMore,
          //             arguments: {
          //               'title': 'Upcoming Movies',
          //               'providerKey': 'upcoming'
          //             }),
          //         child: Text(
          //           'See More',
          //           style: Theme.of(context).textTheme.bodySmall,
          //         ),
          //       )
          //     ],
          //   ),
          // ),

          // upcomingMovieState.when(
          //   data: (data) => SizedBox(
          //     height: 220,
          //     child: ListView.builder(
          //         shrinkWrap: true,
          //         controller: _scrollControllerUpcoming,
          //         itemCount: data.length,
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) {
          //           final item = data[index];

          //           EdgeInsets margin = EdgeInsets.only(
          //             left: index == 0 ? 11 : 4,
          //             right: index == data.length - 1 ? 11 : 4,
          //           );

          //           return AppMovieCoverBox(item: item, margin: margin);
          //         }),
          //   ),
          //   loading: () => AppMovieCoverBox.loading(),
          //   error: (error, stackTrace) => Center(child: Text('Error: $error')),
          // )
        ],
      ),
    );
  }
}
