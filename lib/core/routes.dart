import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/people/presentation/screens/actor_detail.dart';
import 'package:flutter_movie_app/features/stream_movie/presentation/screens/movie_list.dart';
import 'package:flutter_movie_app/features/stream_movie/presentation/screens/movie_stream.dart';

import '../features/tv/presentation/screens/screen.dart';
import '../features/movie/presentation/screens/screens.dart';
import 'presentation/screens/menu.dart';
import 'presentation/screens/movie_clip.dart';

class Routes {
  static const String menu = '/menu';

  static const String movieDetail = '/movie_detail';
  static const String movieSearch = '/movie_search';
  static const String seeMore = '/see_more';
  static const String seats = '/seats';
  static const String actorDetail = '/actor_detail';
  static const String clipMovie = '/clip_movie';

  static const String movieList = '/movie_list';
  static const String movieStream = '/movie_stream';

  static const String seeMoreTv = '/see_more_tv';
  static const String tvDetail = '/tv_detail';
  static const String tvSearch = '/tv_search';
  static const String tvSeasonDetail = '/tv_season_detail';
  static const String tvEpisodeDetail = '/tv_episode_detail';

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

      case movieList:
        final movieTitle = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => MovieList(movieTitle: movieTitle));

      case movieStream:
        final movieStreamUrl = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => MovieStreamPage(streamUrl: movieStreamUrl));

      case tvSeasonDetail:
        final args = settings.arguments as Map<String, dynamic>;
        final seriesId = args['seriesId'];
        final seasonNumber = args['seasonNumber'];
        return MaterialPageRoute(
            builder: (_) => TvSeasonDetailPage(seriesId, seasonNumber));

      case tvEpisodeDetail:
        final args = settings.arguments as Map<String, dynamic>;
        final seriesId = args['seriesId'];
        final seasonNumber = args['seasonNumber'];
        final episodeNumber = args['episodeNumber'];
        return MaterialPageRoute(
            builder: (_) =>
                TvEpisodeDetailPage(seriesId, seasonNumber, episodeNumber));

      case movieSearch:
        return MaterialPageRoute(builder: (_) => const MovieSearchPage());

      case tvSearch:
        return MaterialPageRoute(builder: (_) => const TvSearchPage());

      case actorDetail:
        final int personId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => ActorDetailPage(personId));

      case clipMovie:
        final args = settings.arguments as Map<String, dynamic>;

        final movieId = args['movieId'];
        final provider = args['providerKey'];
        final title = args['title'];
        final seriesId = args['seriesId'];
        final seasonNumber = args['seasonNumber'];
        final episodeNumber = args['episodeNumber'];

        return MaterialPageRoute(
            builder: (_) => MovieClipPage(
                  provider,
                  title,
                  movieId: movieId,
                  seriesId: seriesId,
                  seasonNumber: seasonNumber,
                  episodeNumber: episodeNumber,
                ));

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
        final date = args['date'];
        final provider = args['providerKey'];
        return MaterialPageRoute(
            builder: (_) => SeeMoreTvPage(
                  title,
                  provider,
                  date: date,
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
