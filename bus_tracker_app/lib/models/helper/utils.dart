// TextStyle mainTextStyle() {
//     return const TextStyle(fontSize: 15, color: Colors.grey);
//   }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static TextStyle mainTextStyle() {
    return const TextStyle(
        fontSize: 15, color: Color.fromARGB(255, 16, 16, 16));
  }

  static BoxDecoration gradientDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
          Color.fromARGB(255, 254, 225, 194),
          Color.fromARGB(255, 215, 222, 248)
        ]));
  }
}
