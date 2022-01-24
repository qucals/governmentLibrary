import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LibraryTextField extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? hintText;
  final InputBorder? border;

  const LibraryTextField({
    Key? key,
    this.backgroundColor = Colors.white,
    this.borderRadius = 0,
    this.padding = const EdgeInsets.only(left: 20, right: 20),
    this.margin = const EdgeInsets.fromLTRB(20, 10, 10, 10),
    this.hintText = 'Text',
    this.border = InputBorder.none,
  }) : super(key: key);

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
