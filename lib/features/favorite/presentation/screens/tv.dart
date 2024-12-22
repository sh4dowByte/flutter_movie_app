import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/presentation/widget/star_rating.dart';
import 'package:flutter_movie_app/core/utils/date_helper.dart';
import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';
import 'package:flutter_movie_app/features/favorite/presentation/notifiers/tv_favorite_notifier.dart';
import 'package:flutter_movie_app/features/favorite/presentation/widgets/app_image_slider.dart';
import 'package:flutter_movie_app/features/movie/presentation/widgets/app_movie_card.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/routes.dart';

class TvFavoritePage extends ConsumerStatefulWidget {
  const TvFavoritePage({super.key});

  @override
  ConsumerState<TvFavoritePage> createState() => _TvFavoritePageState();
}

class _TvFavoritePageState extends ConsumerState<TvFavoritePage> {
  final ScrollController _scrollControllerUpcoming = ScrollController();
  int genreId = 0;
  Favorite? fav;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoriteTvProvider.notifier).getFavoriteTv();
    });
  }

  @override
  void dispose() {
    _scrollControllerUpcoming.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMoviesState = ref.watch(favoriteTvProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            favoriteMoviesState.when(
              data: (data) => SizedBox(
                height: 440,
                child: AppImageSlider(
                  onTap: (id) {
                    Navigator.pushNamed(context, Routes.tvDetail,
                        arguments: id);
                  },
                  onChange: (data) => setState(() {
                    fav = data;
                  }),
                  data: data,
                ),
              ),
              loading: () => AppMovieCoverBox.loading(),
              error: (error, stackTrace) {
                setState(() {
                  fav = null;
                });
                return Center(child: AppError(error as Failure));
              },
            ),

            //
            if (fav != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      fav!.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateHelper.toYear(fav!.date),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(width: 10),
                        StarRating(rating: fav!.voteAverage),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      fav!.overview,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
