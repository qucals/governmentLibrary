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
class LibraryAlertDialog extends StatelessWidget {
  double height;

  Widget title;
  Widget content;
  List<Widget> actions;

  LibraryAlertDialog({
    Key? key,
    required this.height,
    required this.title,
    required this.content,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: height,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: title,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: content,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: actions,
              ),
            )
          ],
        ),
      ),
    );
  }
}
