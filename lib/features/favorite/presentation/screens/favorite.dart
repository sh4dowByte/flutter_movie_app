import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/favorite/presentation/notifiers/movie_favorite_notifier.dart';
import 'package:flutter_movie_app/features/favorite/presentation/widgets/app_image_slider_manual.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_movie_app/features/movie/presentation/widgets/app_movie_card.dart';
import 'package:flutter_movie_app/features/movie/presentation/widgets/star_rating.dart';
import 'package:flutter_movie_app/widget/app_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/routes.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  final ScrollController _scrollControllerUpcoming = ScrollController();
  int genreId = 0;
  Movie? movie;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoriteMoviesProvider.notifier).getFavoriteMovie();
    });
  }

  @override
  void dispose() {
    _scrollControllerUpcoming.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMoviesState = ref.watch(favoriteMoviesProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            favoriteMoviesState.when(
              data: (data) => SizedBox(
                height: 440,
                child: AppImageSliderManual(
                  onTap: (id) {
                    Navigator.pushNamed(context, Routes.movieDetail,
                        arguments: id);
                  },
                  onChange: (data) => setState(() {
                    movie = data;
                  }),
                  data: data,
                ),
              ),
              loading: () => AppMovieCoverBox.loading(),
              error: (error, stackTrace) {
                setState(() {
                  movie = null;
                });
                return Center(child: AppError(error as Failure));
              },
            ),

            //
            if (movie != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      movie!.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                    StarRating(rating: movie!.voteAverage)
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
