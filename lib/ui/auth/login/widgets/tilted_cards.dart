import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_learn/utils/image_error_listener.dart';

class TiltedCards extends StatelessWidget {
  const TiltedCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: const AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: _Card(
                imageUrl: 'https://rstr.in/google/tripedia/g2i0BsYPKW-',
                width: 200,
                height: 273,
                tilt: -3.83 / 360,
                showTitle: false,
              ),
            ),
            Positioned(
              right: 0,
              child: _Card(
                imageUrl: 'https://rstr.in/google/tripedia/980sqNgaDRK',
                width: 200,
                height: 273,
                tilt: 3.83 / 360,
                showTitle: false,
              ),
            ),
            _Card(
              imageUrl: 'https://rstr.in/google/tripedia/pHfPmf3o5NU',
              width: 225,
              height: 322,
              tilt: 0,
              showTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.tilt,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.showTitle,
  });

  final double tilt;
  final double width;
  final double height;
  final String imageUrl;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(tilt),
      child: SizedBox(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                color: showTitle ? Colors.black.withValues(alpha: 0.5) : null,
                colorBlendMode: showTitle ? BlendMode.darken : null,
                errorListener: imageErrorListener,
              ),
              if (showTitle) Center(child: SvgPicture.asset('assets/logo.svg')),
            ],
          ),
        ),
      ),
    );
  }
}
