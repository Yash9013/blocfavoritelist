import 'package:flutter/material.dart';

appText({
  required String text,
  required double fontsize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontsize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
