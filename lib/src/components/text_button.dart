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

// ignore: must_be_immutable
class LibraryTextButton extends StatelessWidget {
  final Function onPressed;

  Widget child;
  
  final double width;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;

  LibraryTextButton({
    Key? key,
    required this.onPressed,
    required this.child, 
    required this.width,
    required this.height,
    this.borderRadius = 15.0,
    this.backgroundColor, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: child,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) => backgroundColor ?? Theme.of(context).colorScheme.secondary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          ),
        )
      )
    );
  }
}
