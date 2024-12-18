import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movie_app/core/utils/image_url_helper.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';

class AppImageSlider extends StatefulWidget {
  final List<Movie> data;
  final Function(int)? onTap;
  final Function(Movie)? onChange;

  const AppImageSlider(
      {super.key, required this.data, this.onTap, this.onChange});

  @override
  State<AppImageSlider> createState() => _AppImageSliderState();
}

class _AppImageSliderState extends State<AppImageSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.6);
  int _currentPage = 0;

  @override
  void didUpdateWidget(covariant AppImageSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_currentPage >= widget.data.length) {
      _currentPage = widget.data.isNotEmpty ? widget.data.length - 1 : 0;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.onChange != null && widget.data.isNotEmpty) {
        widget.onChange!(widget.data[_currentPage]);
      }
    });

    _pageController.addListener(() {
      final direction = _pageController.position.userScrollDirection;

      if (direction != ScrollDirection.idle) {
        setState(() {
          // Periksa apakah page sudah sepenuhnya diubah
          int newPage = _pageController.page?.round() ?? _currentPage;
          if (newPage != _currentPage) {
            _currentPage = newPage;

            if (widget.onChange != null) {
              widget.onChange!(widget.data[_currentPage]);
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        if (widget.data.isNotEmpty) ...[
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: widget.data[_currentPage.toInt()].backdropPath != null
                  ? ImageUrlHelper.getBackdropUrl(
                      widget.data[_currentPage.toInt()].backdropPath)
                  : ImageUrlHelper.getPosterUrl(
                      widget.data[_currentPage.toInt()].posterPath),
              fit: BoxFit.cover,
            ),
          ),
        ],

        // Blur filter and gradient overlay
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(1), // Top darker
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                    Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(1), // Bottom darker
                  ],
                ),
              ),
            ),
          ),
        ),

        // Image slider with titles and details
        PageView.builder(
          controller: _pageController,
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            // Calculate scaling effect for current page
            final scale = (_currentPage - index).abs() < 1
                ? 1 - (_currentPage - index).abs() * 0.2
                : 0.8;

            return InkWell(
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!(widget.data[index].id);
                }
              },
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: scale, end: scale),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      // Image content
                      SizedBox(
                        width: double.infinity,
                        height: 391,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: ImageUrlHelper.getPosterUrl(
                                widget.data[index].posterPath,
                                size: ImageSize.posterW500),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
