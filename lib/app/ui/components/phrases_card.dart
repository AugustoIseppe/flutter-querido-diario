import 'dart:math';

import 'package:flutter/material.dart';
import 'package:querido_diario/app/utils/assets.dart';

class PhrasesCard extends StatefulWidget {
  final String phrases;

  final String? image;

  final List<String>? phrasesPool;

  const PhrasesCard({
    super.key,
    required this.phrases,
    this.image,
    this.phrasesPool,
  });

  @override
  State<PhrasesCard> createState() => _PhrasesCardState();
}

class _PhrasesCardState extends State<PhrasesCard>
    with SingleTickerProviderStateMixin {
  String? _currentImage;
  late String _currentPhrase;
  final _rand = Random();

  late final List<String> _phrasesPool;

  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool _swapped = false;

  @override
  void initState() {
    super.initState();

    if (widget.image != null && widget.image!.isNotEmpty) {
      _currentImage = widget.image;
    } else {
      _currentImage = _pickRandomImage();
    }

    _phrasesPool = widget.phrasesPool ?? List<String>.from(defaultPhrases);
    if (!_phrasesPool.contains(widget.phrases)) {
      _phrasesPool.insert(0, widget.phrases);
    }
    _currentPhrase = widget.phrases;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _animation.addListener(() {
      if (!_swapped && _animation.value >= 0.5) {
        _swapContent();
        _swapped = true;
      }
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _swapped = false;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _pickRandomImage() => cardImages[_rand.nextInt(cardImages.length)];

  String _pickRandomPhrase() =>
      _phrasesPool[_rand.nextInt(_phrasesPool.length)];

  void _swapContent() {
    String nextImage = _pickRandomImage();
    if (cardImages.length > 1) {
      int safety = 10;
      while (nextImage == _currentImage && safety-- > 0) {
        nextImage = _pickRandomImage();
      }
    }

    String nextPhrase = _pickRandomPhrase();
    if (_phrasesPool.length > 1) {
      int safety = 10;
      while (nextPhrase == _currentPhrase && safety-- > 0) {
        nextPhrase = _pickRandomPhrase();
      }
    }

    setState(() {
      _currentImage = nextImage;
      _currentPhrase = nextPhrase;
    });
  }

  void _onTap() {
    if (_controller.isAnimating) return;
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final bool hasImage = _currentImage != null && _currentImage!.isNotEmpty;
    return SizedBox(
      height: 130,
      child: GestureDetector(
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              final angle = _animation.value * pi;
              final Matrix4 transform =
                  Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle);
      
              final bool pastHalf = angle > (pi / 2);
      
              Widget content = Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image:
                      hasImage
                          ? DecorationImage(
                            image: AssetImage(_currentImage!),
                            fit: BoxFit.cover,
                          )
                          : null,
                ),
                child: Stack(
                  children: [
                    if (hasImage)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withAlpha(45),
                                Colors.black.withAlpha(15),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white38,
                            ),
                            child: SizedBox(
                              width: 280,
                              child: Text(
                                _currentPhrase,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      
              if (pastHalf) {
                content = Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: content,
                );
              }
      
              return Transform(
                transform: transform,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: content,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
