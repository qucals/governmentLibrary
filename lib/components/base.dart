import 'package:flutter/material.dart';

// ignore: must_be_immutable
abstract class LibraryStatelessWidget extends StatelessWidget {
  Color? backgroundColor;
  double? borderRadius;
  EdgeInsets? padding;
  EdgeInsets? margin;
  String? hintText;
  Color? textColor;
  InputBorder? border;

  LibraryStatelessWidget({
    Key? key,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.hintText,
    this.textColor,
    this.border,
  }) : super(key: key);
}
