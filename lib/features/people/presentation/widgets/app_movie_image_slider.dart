import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/routes.dart';
import 'package:flutter_movie_app/core/utils/image_url_helper.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_movie_app/features/movie/presentation/widgets/app_button_play_trailer.dart';
import 'package:flutter_movie_app/core/widget/app_skeleton.dart';

class AppMovieImageSlider extends StatefulWidget {
  final List<Movie> movie;
  final int maxLength;
  final Function()? onSeeMore;
  const AppMovieImageSlider(
      {super.key, required this.movie, this.maxLength = 14, this.onSeeMore});

  @override
  State<AppMovieImageSlider> createState() => _AppMovieImageSliderState();

  static Widget loading() {
    return const AppSkeleton(
      height: 362,
    );
  }
}

class _AppMovieImageSliderState extends State<AppMovieImageSlider>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late Timer _timer;
  late AnimationController _animationController;
  late bool _seeMore;
  late List<Movie> movie;

  @override
  void initState() {
    super.initState();
    // Setup animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 5), // Set the duration for the progress animation
    );

    // Timer untuk mengubah halaman otomatis setiap 3 detik
    _timer = Timer.periodic(const Duration(seconds: 1), _onTimerTick);

    _seeMore = widget.maxLength < widget.movie.length;
    movie = widget.movie.take(widget.maxLength).toList();
  }

  @override
  void dispose() {
    _timer.cancel(); // Hentikan timer ketika widget di-destroy
    _animationController.dispose(); // Hapus controller animasi
    super.dispose();
  }

  void _onTimerTick(Timer timer) {
    setState(() {
      if (_animationController.isCompleted) {
        // Pindah ke halaman berikutnya ketika progress selesai
        if (_currentIndex < movie.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        _animationController.reset();
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: movie.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
              _animationController
                  .reset(); // Reset animasi saat halaman diganti
            });
          },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: ImageUrlHelper.getBackdropUrl(
                        movie[index].backdropPath,
                        size: ImageSize.backdropOriginal),
                    fit: BoxFit
                        .cover, // Gambar akan memenuhi area tanpa mengubah proporsi
                    placeholder: (context, url) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: ImageUrlHelper.getBackdropUrl(
                                movie[index].backdropPath,
                                size: ImageSize.backdropW300),
                            fit: BoxFit.cover,
                          ),
                          BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // Image
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex--;

                          if (_currentIndex < 0) {
                            _currentIndex = movie.length - 1;
                          }

                          _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );

                          _animationController
                              .reset(); // Reset animasi saat halaman diganti
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (_currentIndex < movie.length - 1) {
                            _currentIndex++;
                          } else {
                            _currentIndex = 0;
                          }

                          _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          _animationController
                              .reset(); // Reset animasi saat halaman diganti
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ),
                  ],
                ),

                // Backdroop
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(top: 60),
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(1),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.9),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.8),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.6),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.2),
                          Colors.transparent,
                        ],
                      ),
                    ),

                    // Title
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20)
                          .copyWith(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: () => Navigator.pushNamed(
                                context, Routes.movieDetail,
                                arguments: movie[_currentIndex].id),
                            child: Text(
                              movie[_currentIndex].title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 20),
                              maxLines: 1,
                            ),
                          ),
                          if (movie[_currentIndex].character != null) ...[
                            Text(
                              movie[_currentIndex].character!,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppButtonPlayTrailer(
                                  movieId: movie[_currentIndex].id),
                              Visibility(
                                visible: _seeMore,
                                child: InkWell(
                                  hoverColor:
                                      Colors.transparent, // Hapus efek hover
                                  onTap: widget.onSeeMore,
                                  child: Text(
                                    'See More',
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Backdrop top
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: Container(
                //     height: 80,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         end: Alignment.bottomCenter, // Awal gradien
                //         begin: Alignment.topCenter, // Akhir gradien
                //         colors: [
                //           Theme.of(context)
                //               .scaffoldBackgroundColor
                //               .withOpacity(0.9),

                //           Theme.of(context)
                //               .scaffoldBackgroundColor
                //               .withOpacity(0.5),
                //           Theme.of(context)
                //               .scaffoldBackgroundColor
                //               .withOpacity(0.2),
                //           Colors.transparent, // Warna akhir
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),

        // Indicator
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                movie.length,
                (index) {
                  final screenWidth = MediaQuery.of(context).size.width;
                  final maxWidth =
                      screenWidth / movie.length - 10; // Proporsional
                  const double activeWidth = 41; // Batas panjang aktif
                  final double inactiveWidth =
                      maxWidth > 16 ? 16 : maxWidth / 2; // Panjang nonaktif

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: _currentIndex == index ? activeWidth : inactiveWidth,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Visibility(
                      visible: _currentIndex == index,
                      child: Row(
                        children: [
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Container(
                                height: 8,
                                width: _animationController.value *
                                    activeWidth, // Progress width dinamis
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
