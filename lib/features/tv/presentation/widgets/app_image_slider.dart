import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/utils/image_url_helper.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_skeleton.dart';

class AppImageSlider extends StatefulWidget {
  final List<String> image;
  final int maxLength;
  final Function()? onSeeMore;
  const AppImageSlider(
      {super.key, required this.image, this.maxLength = 10, this.onSeeMore});

  @override
  State<AppImageSlider> createState() => _AppImageSliderState();

  static Widget loading() {
    return const AppSkeleton(
      height: 362,
    );
  }
}

class _AppImageSliderState extends State<AppImageSlider>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late Timer _timer;
  late AnimationController _animationController;
  late bool _seeMore;
  late List<String> image;

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

    _seeMore = widget.maxLength < widget.image.length;
    image = widget.image.take(widget.maxLength).toList();
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
        if (_currentIndex < image.length - 1) {
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
          itemCount: image.length,
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
                    imageUrl: ImageUrlHelper.getBackdropUrl(image[index],
                        size: ImageSize.backdropOriginal),
                    fit: BoxFit
                        .cover, // Gambar akan memenuhi area tanpa mengubah proporsi
                    placeholder: (context, url) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: ImageUrlHelper.getBackdropUrl(
                                image[index],
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
                            _currentIndex = image.length - 1;
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
                          if (_currentIndex < image.length - 1) {
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
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -2,
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
                  ),
                ),
              ],
            );
          },
        ),

        // Indicator
        Align(
          alignment: Alignment.bottomRight,
          child: Visibility(
            visible: image.length > 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16)
                  .copyWith(right: 8, left: 160),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(
                  image.length,
                  (index) {
                    final screenWidth = MediaQuery.of(context).size.width - 170;
                    final maxWidth =
                        screenWidth / image.length - 10; // Proporsional
                    const double activeWidth = 41; // Batas panjang aktif
                    final double inactiveWidth =
                        maxWidth > 16 ? 16 : maxWidth / 2; // Panjang nonaktif

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 6,
                      width:
                          _currentIndex == index ? activeWidth : inactiveWidth,
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
        ),

        Positioned(
          right: 20,
          bottom: 30,
          child: Visibility(
            visible: _seeMore,
            child: InkWell(
              hoverColor: Colors.transparent, // Hapus efek hover
              onTap: widget.onSeeMore,
              child: Text(
                'See More',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
