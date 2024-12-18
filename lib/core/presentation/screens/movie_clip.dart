import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/data/models/movie_clip.dart';
import 'package:flutter_movie_app/features/movie/presentation/notifiers/movie_clip_notifier.dart';
import 'package:flutter_movie_app/core/widget/app_skeleton.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_clip_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieClipPage extends ConsumerStatefulWidget {
  final String providerKey;
  final String title;
  final int? movieId;
  final int? seriesId;
  final int? seasonNumber;
  final int? episodeNumber;
  const MovieClipPage(
    this.providerKey,
    this.title, {
    super.key,
    this.movieId,
    this.seriesId,
    this.seasonNumber,
    this.episodeNumber,
  });

  @override
  ConsumerState<MovieClipPage> createState() => MovieClipPageState();
}

class MovieClipPageState extends ConsumerState<MovieClipPage> {
  late final StateNotifierProvider<dynamic, AsyncValue<List<MovieClip>>>
      provider;

  // Tambahkan variabel untuk melacak video yang sedang aktif
  String? _activeVideoId;

  @override
  void initState() {
    super.initState();

    // Tetapkan provider berdasarkan `providerKey`
    switch (widget.providerKey) {
      case 'movie_clip':
        provider = clipMoviesProvider;
        break;
      case 'tv_clip':
        provider = clipTvProvider;
        break;
      default:
        throw Exception('Invalid providerKey: ${widget.providerKey}');
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      switch (widget.providerKey) {
        case 'movie_clip':
          ref.read(provider.notifier).getInitial(widget.movieId!);
          break;
        case 'tv_clip':
          ref.read(provider.notifier).getInitial(
              widget.seriesId!, widget.seasonNumber, widget.episodeNumber);
          break;
        default:
          throw Exception('Invalid providerKey: ${widget.providerKey}');
      }
    });
  }

  void setActiveVideo(String videoId) {
    setState(() {
      _activeVideoId = videoId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: state.when(
        data: (data) => SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return AppMovieClipCover(
                item: item,
                activeVideoId: _activeVideoId,
                onPlay:
                    setActiveVideo, // Panggil fungsi untuk mengatur video aktif
              );
            },
          ),
        ),
        loading: () => AppMovieClipCover.loading(),
        error: (error, stackTrace) => Center(child: Text('$error')),
      ),
    );
  }
}

class AppMovieClipCover extends StatefulWidget {
  const AppMovieClipCover({
    super.key,
    required this.item,
    required this.activeVideoId,
    required this.onPlay,
  });

  final MovieClip item;
  final String? activeVideoId; // Tambahkan ID video aktif
  final Function(String videoId) onPlay; // Callback untuk mengatur video aktif

  @override
  State<AppMovieClipCover> createState() => _AppMovieClipCoverState();

  static Widget loading() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10, // Jumlah skeleton placeholder
      itemBuilder: (context, index) {
        return skeleton();
      },
    );
  }

  static Padding skeleton() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: AppSkeleton(
        height: 230,
      ),
    );
  }
}

class _AppMovieClipCoverState extends State<AppMovieClipCover> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.item.key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Periksa apakah video ini adalah video aktif
    final isActive = widget.item.key == widget.activeVideoId;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: isActive
          ? ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.redAccent,
                ),
                onReady: () {
                  _controller.play(); // Play saat menjadi aktif
                },
              ),
            )
          : GestureDetector(
              onTap: () {
                widget.onPlay(widget.item.key); // Set video aktif
                _controller.play();
              },
              child: InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                // onTap: () async {
                //   // if (!await launchUrl(
                //   //     Uri(
                //   //       scheme: 'https',
                //   //       host: 'www.youtube.com',
                //   //       path: 'watch',
                //   //       queryParameters: {
                //   //         'v': widget.item.key
                //   //       }, // Tambahkan parameter video ID
                //   //     ),
                //   //     mode: LaunchMode.externalApplication)) {
                //   //   throw Exception('Could not launch ');
                //   // }
                // },
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://img.youtube.com/vi/${widget.item.key}/hqdefault.jpg',
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return CachedNetworkImage(
                                imageUrl:
                                    'https://img.youtube.com/vi/${widget.item.key}/default.jpg',
                                fit: BoxFit.cover,
                              );
                            },
                            errorWidget: (context, url, error) => const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons
                                      .signal_cellular_connected_no_internet_0_bar_rounded,
                                  size: 30,
                                ),
                                SizedBox(height: 30),
                                Text('Sorry, This video unavailable '),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            end: Alignment.topCenter, // Awal gradien
                            begin: Alignment.bottomCenter, // Akhir gradien
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.transparent, // Warna akhir
                            ],
                          ),
                        ),

                        // Title
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20)
                              .copyWith(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.item.name,
                                  style: const TextStyle(color: Colors.white),
                                  maxLines: 2),
                              Text(widget.item.type,
                                  style: const TextStyle(
                                      fontSize: 11, color: Colors.grey)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
