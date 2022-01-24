import 'package:flutter/material.dart';

import 'package:government_library/components/base.dart';

// ignore: must_be_immutable
class LibraryTextField extends LibraryStatelessWidget {
  LibraryTextField({
    Key? key,
    backgroundColor = Colors.white,
    double? borderRadius = 0,
    padding = const EdgeInsets.only(left: 20, right: 20),
    margin = const EdgeInsets.fromLTRB(20, 10, 10, 10),
    hintText = 'Text',
    border = InputBorder.none,
  }) : super(
            key: key,
            backgroundColor: backgroundColor,
            borderRadius: borderRadius,
            padding: padding,
            margin: margin,
            hintText: hintText,
            border: border);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      padding: padding,
      child: TextField(
          decoration: InputDecoration(hintText: hintText, border: border)),
    );
  }
}
