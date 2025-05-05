import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class RoundedImage extends StatelessWidget {
  final ImageProvider image;
  final double? width;
  final double? height;
  final BoxFit fit;

  const RoundedImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppStyles.borderRadius),
      child: Image(
        image: image,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}