import 'package:flutter/material.dart';

class AnimatedGifAsset extends StatelessWidget {
  final String assetPath;
  final BoxFit fit;

  const AnimatedGifAsset({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetPath, fit: fit);
  }
}
