import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

class AnimatedGifAsset extends StatelessWidget {
  static final Set<String> _registeredViewTypes = {};

  final String assetPath;
  final BoxFit fit;

  const AnimatedGifAsset({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    final viewType = 'animated-gif:${_assetUrl(assetPath)}:${fit.name}';
    if (_registeredViewTypes.add(viewType)) {
      ui_web.platformViewRegistry.registerViewFactory(viewType, (viewId) {
        return web.HTMLImageElement()
          ..src = _assetUrl(assetPath)
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.objectFit = _objectFit(fit)
          ..style.display = 'block';
      });
    }

    return HtmlElementView(viewType: viewType);
  }
}

String _assetUrl(String assetPath) {
  if (assetPath.startsWith('assets/')) {
    return 'assets/$assetPath';
  }
  return assetPath;
}

String _objectFit(BoxFit fit) {
  return switch (fit) {
    BoxFit.cover => 'cover',
    BoxFit.fill => 'fill',
    BoxFit.fitHeight => 'contain',
    BoxFit.fitWidth => 'contain',
    BoxFit.none => 'none',
    BoxFit.scaleDown => 'scale-down',
    BoxFit.contain => 'contain',
  };
}
