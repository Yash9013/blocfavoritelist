import 'package:blocproject/utils/text_utils.dart';
import 'package:flutter/material.dart';

AppBar commonAppbar(String appbartitle, {List<Widget>? actions}) {
  return AppBar(
    title:
        appText(text: appbartitle, fontsize: 18, fontWeight: FontWeight.w600),
    centerTitle: true,
    elevation: 0,
    titleTextStyle: const TextStyle(color: Colors.white),
    actions: actions,
  );
}

commonSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 1),
      content: appText(text: message, fontsize: 18, color: Colors.white),
    ),
  );
}
