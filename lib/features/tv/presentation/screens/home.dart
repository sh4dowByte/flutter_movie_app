import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_discover_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_on_the_air_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_popular_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_top_rated_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/widgets/app_tv_image_slider.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/language_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_airing_today_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/widgets/app_tv_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
  final ScrollController _scrollControllerOnTheAir = ScrollController();
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
        ref.read(popularTvProvider.notifier).getNextPage();
      }
    });

    _scrollControllerTopRated.addListener(() {
      if (_scrollControllerTopRated.position.pixels >=
          _scrollControllerTopRated.position.maxScrollExtent) {
        ref.read(topRatedTvProvider.notifier).getNextPage();
      }
    });

    _scrollControllerOnTheAir.addListener(() {
      if (_scrollControllerOnTheAir.position.pixels >=
          _scrollControllerOnTheAir.position.maxScrollExtent) {
        ref.read(onTheAirTvProvider.notifier).getNextPage();
      }
    });
  }

  Future<void> initData() async {
    // ref.read(genreTvProvider.notifier).getInitial();
    ref
        .read(airingTvTodayProvider(
                (DateFormat('yyyy-MM-dd').format(DateTime.now())))
            .notifier)
        .getInitial(dateToday: DateFormat('yyyy-MM-dd').format(DateTime.now()));
    ref.read(discoverTvProvider.notifier).getInitial();
    ref.read(popularTvProvider.notifier).getInitial();
    ref.read(onTheAirTvProvider.notifier).getInitial();
    ref.read(topRatedTvProvider.notifier).getInitial();
  }

  @override
  void dispose() {
    _scrollControllerDiscover.dispose();
    _scrollControllerPopular.dispose();
    _scrollControllerTopRated.dispose();
    _scrollControllerOnTheAir.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topRatedTvState = ref.watch(topRatedTvProvider);
    final onTheAirTvState = ref.watch(onTheAirTvProvider);
    final tvStatePopular = ref.watch(popularTvProvider);
    final airingTodayStateState = ref.watch(airingTvTodayProvider(
        (DateFormat('yyyy-MM-dd').format(DateTime.now()))));

    // Listen perubahan bahasa
    ref.listen<String>(languageProvider, (previous, next) {
      if (previous != next) {
        initData();
      }
    });

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: initData,
        child: ListView(
          padding: const EdgeInsets.only(top: 0, bottom: 40),
          children: [
            // Airing Today
            airingTodayStateState.when(
              loading: () => AppTvImageSlider.loading(),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
              data: (data) => SizedBox(
                height: 362,
                child: AppTvImageSlider(
                  tv: data,
                  onSeeMore: () {
                    Navigator.pushNamed(context, Routes.seeMoreTv, arguments: {
                      'title': 'Airing Today',
                      'providerKey': 'airing_today',
                      'date': DateFormat('yyyy-MM-dd').format(DateTime.now())
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Search
            InkWell(
              hoverColor: Colors.transparent, // Hapus efek hover
              onTap: () => Navigator.pushNamed(context, Routes.tvSearch),
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

            // const SizedBox(height: 23),

            // // Genres
            // genresState.when(
            //   loading: () => AppSelectItemSmall.loading(),
            //   error: (error, stackTrace) =>
            //       AppTvCoverBox.error(error as String),
            //   data: (data) => AppSelectItemSmall(
            //     onChange: (id) {
            //       ref.read(discoverTvProvider.notifier).getInitial(genreId: id);

            //       genreId = id;
            //     },
            //     item: [
            //       const {
            //         'id': 0,
            //         'name': 'All',
            //       },
            //       ...data.map((e) => e.toJson())
            //     ],
            //   ),
            // ),

            // const SizedBox(height: 23),

            // // Discover
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text('Discover'),
            //       InkWell(
            //         onTap: () => Navigator.pushNamed(context, Routes.seeMoreTv,
            //             arguments: {
            //               'title': 'Discover',
            //               'genreId': genreId,
            //               'providerKey': 'discover'
            //             }),
            //         child: Text(
            //           'See More',
            //           style: Theme.of(context).textTheme.bodySmall,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 16),

            // discoverTvState.when(
            //   data: (data) => SizedBox(
            //     height: 220,
            //     child: ListView.builder(
            //         shrinkWrap: true,
            //         controller: _scrollControllerDiscover,
            //         itemCount: data.length,
            //         scrollDirection: Axis.horizontal,
            //         itemBuilder: (context, index) {
            //           final item = data[index];

            //           EdgeInsets margin = EdgeInsets.only(
            //             left: index == 0 ? 11 : 4,
            //             right: index == data.length - 1 ? 11 : 4,
            //           );

            //           return AppTvCoverBox(item: item, margin: margin);
            //         }),
            //   ),
            //   loading: () => AppTvCoverBox.loading(),
            //   error: (error, stackTrace) =>
            //       AppTvCoverBox.error(error as String),
            // ),

            const SizedBox(height: 23),

            // Popular
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12)
                  .copyWith(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular Tv'),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, Routes.seeMoreTv,
                        arguments: {
                          'title': 'Popular Tv',
                          'providerKey': 'popular'
                        }),
                    child: Text(
                      'See More',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
            ),

            tvStatePopular.when(
              data: (data) => SizedBox(
                height: 220,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollControllerPopular,
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
              error: (error, stackTrace) =>
                  AppTvCoverBox.error(error as String),
            ),

            const SizedBox(height: 23),

            // Top Rated
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12)
                  .copyWith(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Top Rated Tv'),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, Routes.seeMoreTv,
                        arguments: {
                          'title': 'Top Rated Tv',
                          'providerKey': 'top_rated'
                        }),
                    child: Text(
                      'See More',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
            ),

            topRatedTvState.when(
              data: (data) => SizedBox(
                height: 220,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollControllerTopRated,
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
              error: (error, stackTrace) =>
                  AppTvCoverBox.error(error as String),
            ),

            const SizedBox(height: 23),

            // On The Air
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12)
                  .copyWith(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('On The Air'),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, Routes.seeMoreTv,
                        arguments: {
                          'title': 'On The Air',
                          'providerKey': 'on_the_air'
                        }),
                    child: Text(
                      'See More',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
            ),

            onTheAirTvState.when(
              data: (data) => SizedBox(
                height: 220,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollControllerOnTheAir,
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
              error: (error, stackTrace) =>
                  AppTvCoverBox.error(error as String),
            )
          ],
        ),
      ),
    );
  }
}
