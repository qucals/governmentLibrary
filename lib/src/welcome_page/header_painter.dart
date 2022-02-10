/*
 Copyright 2022 qucals / https://github.com/qucals

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:government_library/src/theming/theme_manager.dart';

class LibraryCurveHeaderPainter extends CustomPainter {
  ThemeNotifier themeNotifier;

  LibraryCurveHeaderPainter({
    required this.themeNotifier,
  });

  Path getClip(Size size) {
    Path path = Path();

    final double _xScaling = size.width / 390;
    final double _yScaling = size.height / 844;

    path.lineTo(0 * _xScaling, 222 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      222 * _yScaling,
      13 * _xScaling,
      211 * _yScaling,
      13 * _xScaling,
      211 * _yScaling,
    );
    path.cubicTo(
      26 * _xScaling,
      200 * _yScaling,
      52 * _xScaling,
      178 * _yScaling,
      78 * _xScaling,
      182.5 * _yScaling,
    );
    path.cubicTo(
      104 * _xScaling,
      187 * _yScaling,
      130 * _xScaling,
      218 * _yScaling,
      156 * _xScaling,
      217.8 * _yScaling,
    );
    path.cubicTo(
      182 * _xScaling,
      217.7 * _yScaling,
      208 * _xScaling,
      186.3 * _yScaling,
      234 * _xScaling,
      159.7 * _yScaling,
    );
    path.cubicTo(
      260 * _xScaling,
      133 * _yScaling,
      286 * _xScaling,
      111 * _yScaling,
      312 * _xScaling,
      104.2 * _yScaling,
    );
    path.cubicTo(
      338 * _xScaling,
      97.3 * _yScaling,
      364 * _xScaling,
      105.7 * _yScaling,
      377 * _xScaling,
      109.8 * _yScaling,
    );
    path.cubicTo(
      377 * _xScaling,
      109.8 * _yScaling,
      390 * _xScaling,
      114 * _yScaling,
      390 * _xScaling,
      114 * _yScaling,
    );
    path.cubicTo(
      390 * _xScaling,
      114 * _yScaling,
      390 * _xScaling,
      0 * _yScaling,
      390 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      390 * _xScaling,
      0 * _yScaling,
      377 * _xScaling,
      0 * _yScaling,
      377 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      364 * _xScaling,
      0 * _yScaling,
      338 * _xScaling,
      0 * _yScaling,
      312 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      286 * _xScaling,
      0 * _yScaling,
      260 * _xScaling,
      0 * _yScaling,
      234 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      208 * _xScaling,
      0 * _yScaling,
      182 * _xScaling,
      0 * _yScaling,
      156 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      130 * _xScaling,
      0 * _yScaling,
      104 * _xScaling,
      0 * _yScaling,
      78 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      52 * _xScaling,
      0 * _yScaling,
      26 * _xScaling,
      0 * _yScaling,
      13 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      13 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      222 * _yScaling,
      0 * _xScaling,
      222 * _yScaling,
    );
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = themeNotifier.getTheme().primaryColor
      ..style = PaintingStyle.fill;

    final path = getClip(size)..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
