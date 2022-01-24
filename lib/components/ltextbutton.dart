import 'package:flutter/material.dart';
import 'package:government_library/components/base.dart';

// ignore: must_be_immutable
class LibraryTextButton extends LibraryStatelessWidget {
  final Function onPressed;

  LibraryTextButton({
    Key? key,
    required this.onPressed,
    backgroundColor = Colors.black,
    double? borderRadius = 0,
    padding = const EdgeInsets.only(left: 20, right: 20),
    margin = const EdgeInsets.fromLTRB(20, 10, 10, 10),
    hintText = 'Text',
    textColor = Colors.white,
    border = InputBorder.none,
  }) : super(
            key: key,
            backgroundColor: backgroundColor,
            borderRadius: borderRadius,
            padding: padding,
            margin: margin,
            hintText: hintText,
            textColor: textColor,
            border: border);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      padding: padding,
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(hintText!),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(textColor!),
        ),
      ),
    );
  }
}
