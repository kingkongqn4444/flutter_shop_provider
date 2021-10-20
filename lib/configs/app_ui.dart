import 'package:flutter/material.dart';

class UI {
  static List<BoxShadow> boxShadow(BuildContext context) {
    return [
      BoxShadow(
          color: Theme.of(context).highlightColor.withOpacity(0.3),
          offset: Offset(0, 4),
          blurRadius: 10)
    ];
  }
}
