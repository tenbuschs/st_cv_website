import 'package:flutter/material.dart';
import 'dart:async';

class ImageCarousel extends StatefulWidget {
  final List<String> images;

  ImageCarousel({required this.images});

  @override
  State<ImageCarousel> createState() => ImageCarouselState();
}

class ImageCarouselState extends State<ImageCarousel> {
  late final PageController _controller;
  late final Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    if (widget.images.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
        if (_controller.hasClients) {
          _currentPage = (_currentPage + 1) % widget.images.length;
          _controller.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    if (widget.images.length > 1) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              final image = widget.images[index];
              return GestureDetector(
                onTap: () => _showImageDialog(context, widget.images, index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.images.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index ? Colors.white : Colors.grey[600],
                  ),
                );
              }),
            ),
          ),
        SizedBox(height: 16),
      ],
    );
  }

  void _showImageDialog(
    BuildContext context,
    List<String> images,
    int initialIndex,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        int currentIndex = initialIndex;

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.black87,
              insetPadding: const EdgeInsets.all(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Image
                  InteractiveViewer(child: Image.asset(images[currentIndex])),

                  // Left arrow
                  if (images.length > 1)
                    Positioned(
                      left: 8,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            currentIndex =
                                (currentIndex - 1 + images.length) %
                                images.length;
                          });
                        },
                      ),
                    ),

                  // Right arrow
                  if (images.length > 1)
                    Positioned(
                      right: 8,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            currentIndex = (currentIndex + 1) % images.length;
                          });
                        },
                      ),
                    ),

                  // Close button
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
