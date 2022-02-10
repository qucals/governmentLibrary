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
class LibraryTextField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  String text = '';
  final int maxLength;

  final String hintText;
  TextStyle labelStyle;

  final bool autofocus;
  final FocusNode? focusNode;
  final Function? onSubmitted;

  LibraryTextField({
    Key? key,
    required this.hintText,
    required this.labelStyle,
    this.focusNode,
    this.onSubmitted,
    this.autofocus = false,
    this.maxLength = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        onChanged: (String newVal) {
          if (newVal.length <= maxLength) {
            text = newVal;
          } else {
            _controller.text = text;
          }
        },
        autofocus: autofocus,
        style: labelStyle,
        focusNode: focusNode,
        onSubmitted: (value) {
          if (onSubmitted != null) {
            onSubmitted!(value);
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(25, 18, 25, 18),
          filled: true,
          fillColor: const Color(0xFFE5E5EA),
          hintText: hintText,
          hintStyle: labelStyle,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
        ));
  }
}
