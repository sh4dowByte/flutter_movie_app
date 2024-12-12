import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/pallete.dart';
import 'package:flutter_movie_app/core/routes.dart';
import 'package:flutter_movie_app/features/movie/data/models/actor.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_actor_detail_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_actor_notifier.dart';
import 'package:flutter_movie_app/features/movie/presentation/widgets/app_image_slider.dart';
import 'package:flutter_movie_app/features/movie/presentation/widgets/star_rating.dart';
import 'package:flutter_movie_app/widget/app_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../widget/app_skeleton.dart';

class ActorDetailPage extends ConsumerStatefulWidget {
  const ActorDetailPage(this.actorId, {super.key});
  final int actorId;

  @override
  ConsumerState<ActorDetailPage> createState() => _ActorDetailPageState();
}

class _ActorDetailPageState extends ConsumerState<ActorDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(actorActorDetailMoviesProvider(widget.actorId).notifier)
          .getInitial(widget.actorId);

      ref
          .read(actorMoviesProvider(widget.actorId).notifier)
          .getInitial(widget.actorId);
    });
  }

  bool showReadme = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String formatRuntime(int runtime) {
    final hours = runtime ~/ 60; // Hitung jam
    final minutes = runtime % 60; // Sisa menit
    return '$hours h $minutes min';
  }

  @override
  Widget build(BuildContext context) {
    final actorState =
        ref.watch(actorActorDetailMoviesProvider(widget.actorId));
    final actorMovieState = ref.watch(actorMoviesProvider(widget.actorId));

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
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        )),
                    InkWell(
                        onTap: () => Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            ),
                        child: const Icon(
                          Icons.close,
                        )),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: actorMovieState.when(
                    loading: () => AppImageSlider.loading(),
                    error: (error, stackTrace) =>
                        Center(child: Text('Error: $error')),
                    data: (data) => SizedBox(
                      height: 362,
                      child: AppImageSlider(
                          movie: data,
                          onSeeMore: () => Navigator.pushNamed(
                                  context, Routes.seeMore, arguments: {
                                'title': 'Acting',
                                'providerKey': 'actor_movies',
                                'actorId': widget.actorId
                              })),
                    ),
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
                  child: actorState.when(
                      data: (data) => ActorDetailContent(actor: data),
                      error: (error, stackTrace) => AppError(
                            error as Failure,
                            stackTrace: stackTrace,
                          ),
                      loading: () => ActorDetailContent.loading()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ActorDetailContent extends ConsumerStatefulWidget {
  final Actor actor;
  const ActorDetailContent({super.key, required this.actor});

  @override
  ConsumerState<ActorDetailContent> createState() => _ActorDetailContentState();

  static Widget loading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
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
        ],
      ),
    );
  }
}

class _ActorDetailContentState extends ConsumerState<ActorDetailContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(10),
                child: CachedNetworkImage(
                  height: 150,
                  width: 100,
                  imageUrl: widget.actor.imageUrlW300,
                  fit: BoxFit.cover,
                  placeholder: (context, string) {
                    return const AppSkeleton();
                  },
                  errorWidget: (context, url, error) => Container(
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
                    Text(widget.actor.placeOfBirth ?? ''),
                    Text(widget.actor.knownForDepartment,
                        style: Theme.of(context).textTheme.labelSmall),
                    Text(widget.actor.age,
                        style: Theme.of(context).textTheme.labelSmall),
                    const SizedBox(height: 9),
                    StarRating(rating: widget.actor.popularity, starSize: 14),
                    const SizedBox(height: 9),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     gradient: LinearGradient(
                    //       end: Alignment.topCenter, // Awal gradien
                    //       begin: Alignment.bottomCenter, // Akhir gradien
                    //       colors: [
                    //         Colors.white.withOpacity(0.1),
                    //         Colors.white.withOpacity(0.1), // Warna akhir
                    //       ],
                    //     ),
                    //   ),
                    //   width: 145,
                    //   height: 34,
                    //   child: const Row(
                    //     children: [
                    //       Icon(Icons.picture_in_picture),
                    //       SizedBox(width: 10),
                    //       Text(
                    //         'Show Gallery',
                    //         style: TextStyle(fontSize: 12),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Description
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.actor.name,
                  style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 10),
              // Text('Birth: ${widget.actor.formatBirth}',
              //     style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 10),
              Text(widget.actor.biography),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 40),
      ],
    );
  }
}
