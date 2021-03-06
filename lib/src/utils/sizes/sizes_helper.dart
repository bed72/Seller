import 'package:flutter/material.dart';

Size displaySize(BuildContext context, {required bool debug}) {
  if (debug) {
    debugPrint('\n\nš Size = ${MediaQuery.of(context).size.toString()} \n\n');
  }
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context, {bool? debug = false}) {
  if (debug == true) {
    debugPrint(
        '\n\nš Height = ${displaySize(context, debug: debug!).height.toString()} \n\n');
  }
  return displaySize(context, debug: debug!).height;
}

double displayWidth(BuildContext context, {bool? debug = false}) {
  if (debug == true) {
    debugPrint(
        '\n\nš Width = ${displaySize(context, debug: debug!).width.toString()} \n\n');
  }
  return displaySize(context, debug: debug!).width;
}
