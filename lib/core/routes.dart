import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/tv/presentation/screens/see_more.dart';
import 'package:flutter_movie_app/features/tv/presentation/screens/tv_detail.dart';
import 'package:flutter_movie_app/features/tv/presentation/screens/tv_search.dart';

import '../features/movie/presentation/screens/screens.dart';
import '../screens/menu.dart';

class Routes {
  static const String menu = '/menu';

  static const String movieDetail = '/movie_detail';
  static const String movieSearch = '/movie_search';
  static const String seeMore = '/see_more';
  static const String seats = '/seats';
  static const String actorDetail = '/actor_detail';
  static const String clipMovie = '/clip_movie';

  static const String seeMoreTv = '/see_more_tv';
  static const String tvDetail = '/tv_detail';
  static const String tvSearch = '/tv_search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case menu:
        return MaterialPageRoute(builder: (_) => const MenuPage());

      case movieDetail:
        final int movieId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => MovieDetailPage(movieId));

      case tvDetail:
        final int seriesId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => TvDetailPage(seriesId));

      case movieSearch:
        return MaterialPageRoute(builder: (_) => const MovieSearchPage());

      case tvSearch:
        return MaterialPageRoute(builder: (_) => const TvSearchPage());

      case actorDetail:
        final int personId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => ActorDetailPage(personId));

      case clipMovie:
        final int movieId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => MovieClipPage(movieId));

      case seeMore:
        final args = settings.arguments as Map<String, dynamic>;
        final genreId = args['genreId'];
        final actorId = args['actorId'];
        final title = args['title'];
        final provider = args['providerKey'];
        return MaterialPageRoute(
            builder: (_) => SeeMorePage(
                  title,
                  provider,
                  genreId: genreId,
                  actorId: actorId,
                ));

      case seeMoreTv:
        final args = settings.arguments as Map<String, dynamic>;
        final genreId = args['genreId'];
        final actorId = args['actorId'];
        final title = args['title'];
        final provider = args['providerKey'];
        return MaterialPageRoute(
            builder: (_) => SeeMoreTvPage(
                  title,
                  provider,
                  genreId: genreId,
                  actorId: actorId,
                ));

      case '/':
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Routes'),
                    centerTitle: true, // Judul di tengah
                  ),
                  body: const Center(
                    child: Text('Routes Not Found'),
                  ),
                ));
    }
  }
}
