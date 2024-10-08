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
import 'package:flutter_svg/svg.dart';

class LibraryPressButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  final String textButton;
  final Function onPressed;

  final TextStyle? textStyle;
  final Color? backgroundColor;

  final SvgPicture icon;

  static const TextStyle lightTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle darkTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  const LibraryPressButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.textButton,
      required this.icon,
      required this.onPressed,
      this.borderRadius = 15.0,
      this.textStyle,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Row(
          children: <Widget>[
            Text(
              textButton,
              style: textStyle ?? TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700,
              ),
                  // (Theme.of(context).brightness == Brightness.light
                      // ? lightTextStyle
                      // : darkTextStyle),
            ),
            const Spacer(flex: 1),
            icon
          ],
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(25, 18, 25, 18)),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) =>
                    backgroundColor ?? Theme.of(context).colorScheme.secondary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ))),
      ),
    );
  }
}

class LibraryAnimatedPressButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  final String textButton;
  final Function onPressed;

  final TextStyle? textStyle;
  final Color? backgroundColor;

  final SvgPicture icon;

  static const TextStyle lightTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle darkTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  const LibraryAnimatedPressButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.textButton,
      required this.icon,
      required this.onPressed,
      this.borderRadius = 15.0,
      this.textStyle,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Row(
          children: <Widget>[
            Text(
              textButton,
              style: textStyle ??
                  (Theme.of(context).brightness == Brightness.light
                      ? lightTextStyle
                      : darkTextStyle),
            ),
            const Spacer(flex: 1),
            icon
          ],
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(25, 18, 25, 18)),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) =>
                    backgroundColor ?? Theme.of(context).colorScheme.secondary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ))),
      ),
    );
  }
}
