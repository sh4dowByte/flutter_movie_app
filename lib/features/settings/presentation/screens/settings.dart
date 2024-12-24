import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_choose_item_small.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_icons8.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_genre_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_now_playing_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_popular_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_top_rated_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_upcoming_notifier.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/adult_notifier.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/language_notifier.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/movie_genre_notifier.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/tv_genre_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_airing_today_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_genre_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_on_the_air_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_popular_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_top_rated_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/widget/app_svg_icon.dart';
import '../notifiers/theme_notifier.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(genreTvProvider.notifier).getInitial();
      ref.read(genreMoviesProvider.notifier).getInitial();
      ref.read(tvGenreProvider);
      ref.read(movieGenreProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    final isAdult = ref.watch(isAdultProvider);
    final isAdultNotifier = ref.read(isAdultProvider.notifier);

    final currentLanguage = ref.watch(languageProvider);
    final languageNotifier = ref.read(languageProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Settings'),
      ),
      body: ListView(
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            AppMenuTile(
              title: 'Language',
              icon: 'language',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return ChoseLanguageComponent(
                      onSelect: (lang) {
                        languageNotifier.changeLanguage(lang);
                        ref.read(genreTvProvider.notifier).getInitial();

                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              leading: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                child: Row(
                  children: [
                    ChoseLanguageComponent.getLabel(context, currentLanguage),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            AppMenuTile(
              title: 'Dark Mode',
              icon: 'theme',
              onTap: () => themeNotifier.toggleTheme(),
              leading: SizedBox(
                height: 1,
                child: Switch(
                  value: isDarkMode,
                  onChanged: (value) => themeNotifier.toggleTheme(),
                ),
              ),
            ),
            AppMenuTile(
              title: 'Show adult content',
              icon: 'adult',
              onTap: () => isAdultNotifier.toggleIsAdult(),
              leading: SizedBox(
                height: 1,
                child: Switch(
                  value: isAdult,
                  onChanged: (value) => isAdultNotifier.toggleIsAdult(),
                ),
              ),
            ),

            // Genre
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Genre',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
              ),
            ),
            AppMenuTile(
              title: 'Tv Show ',
              icon: 'tv',
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return const ChoseTvGenreComponent();
                  },
                );

                // ref
                //     .read(airingTvTodayProvider(
                //             DateFormat('yyyy-MM-dd').format(DateTime.now()))
                //         .notifier)
                //     .resetCache();
                ref
                    .read(airingTvTodayProvider(
                            DateFormat('yyyy-MM-dd').format(DateTime.now()))
                        .notifier)
                    .getInitial(
                        dateToday:
                            DateFormat('yyyy-MM-dd').format(DateTime.now()));
                ref.read(popularTvProvider.notifier).getInitial();
                ref.read(onTheAirTvProvider.notifier).getInitial();
                ref.read(topRatedTvProvider.notifier).getInitial();
              },
            ),
            AppMenuTile(
              title: 'Movie ',
              icon: 'movie',
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return const ChoseMovieGenreComponent();
                  },
                );

                ref.read(nowPlayingMoviesProvider.notifier).getInitialMovies();
                ref.read(popularMoviesProvider.notifier).getInitialMovies();
                ref.read(topRatedMoviesProvider.notifier).getInitialMovies();
                ref.read(upcomingMoviesProvider.notifier).getInitialMovies();
              },
            ),
          ]),
    );
  }
}

class AppMenuTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String? icon;
  final Function()? onTap;
  const AppMenuTile({
    super.key,
    this.leading,
    required this.title,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  AppSvgIcon(icon!, color: Theme.of(context).iconTheme.color),
                  const SizedBox(width: 16),
                ],
                Text(title),
              ],
            ),
            leading ??
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                )
          ],
        ),
      ),
    );
  }
}

class ChoseLanguageComponent extends StatelessWidget {
  final Function(String)? onSelect;
  const ChoseLanguageComponent({
    super.key,
    this.onSelect,
  });

  static List<Map<dynamic, String>> language = [
    {
      'lang': 'id-ID',
      'country': 'Indonesia',
      'flag': 'lph_obIfg-jT',
    },
    {
      'lang': 'en-US',
      'country': 'United States',
      'flag': 'kmhygyVC3wiA',
    },
    {
      'lang': 'ja-JP',
      'country': 'Japanese',
      'flag': 'McQbrq9qaQye',
    },
    {
      'lang': 'ko-KR',
      'country': 'Korea',
      'flag': '-_RS8ho736Fs',
    },
    {
      'lang': 'ar-SA',
      'country': 'Arabic',
      'flag': 'NA7wq_gDd9d7',
    },
    {
      'lang': 'zh-CN',
      'country': 'Chinese',
      'flag': 'Ej50Oe3crXwF',
    },
    {
      'lang': 'th-TH',
      'country': 'Thailand',
      'flag': 'IWVDTvmUNsig',
    },
    {
      'lang': 'vi-VN',
      'country': 'Vietnam',
      'flag': '2egPD0I7yi4-',
    },
  ];

  static Widget getLabel(BuildContext context, String lang) {
    final item = language.firstWhere(
      (element) => element['lang'] == lang,
      orElse: () => language[0],
    );

    return Row(
      children: [
        // Icon berdasarkan flag
        AppIcons8.getById(
          item['flag'] ?? '',
          width: 25,
          height: 25,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item['country'] ?? ''),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: language.length,
        itemBuilder: (context, index) {
          final item = language[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: InkWell(
              onTap: () {
                if (onSelect != null) {
                  onSelect!(item['lang']!);
                }
              },
              hoverColor: Colors.transparent,
              child: Row(
                children: [
                  AppIcons8.getById(item['flag'] ?? '', width: 35, height: 35),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['country']!),
                      Row(
                        children: [
                          Text(
                            item['lang']!,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item['info'] ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChoseTvGenreComponent extends ConsumerWidget {
  const ChoseTvGenreComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final genresState = ref.watch(genreTvProvider);
    final tvGenreState = ref.watch(tvGenreProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: genresState.when(
        loading: () => AppChooseItemSmall.loading(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (data) => AppChooseItemSmall(
          activeIds: tvGenreState.map((e) => int.parse(e)).toList(),
          onChange: (id) {
            final notifier = ref.read(tvGenreProvider.notifier);
            if (tvGenreState.contains(id.toString())) {
              notifier.removeGenre(id.toString());
            } else {
              notifier.addGenre(id.toString());
            }
          },
          item: data.map((e) => e.toJson()).toList(),
        ),
      ),
    );
  }
}

class ChoseMovieGenreComponent extends ConsumerWidget {
  const ChoseMovieGenreComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final genresState = ref.watch(genreMoviesProvider);
    final movieGenreState = ref.watch(movieGenreProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: genresState.when(
        loading: () => AppChooseItemSmall.loading(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (data) => AppChooseItemSmall(
          activeIds: movieGenreState.map((e) => int.parse(e)).toList(),
          onChange: (id) {
            final notifier = ref.read(movieGenreProvider.notifier);
            if (movieGenreState.contains(id.toString())) {
              notifier.removeGenre(id.toString());
            } else {
              notifier.addGenre(id.toString());
            }
          },
          item: data.map((e) => e.toJson()).toList(),
        ),
      ),
    );
  }
}
