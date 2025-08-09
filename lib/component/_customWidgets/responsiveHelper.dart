import 'package:flutter/material.dart';

class ResponsiveHelper {
  static int cardsPerRow(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 900) {
      return 3;
    } else if (width >= 600) {
      return 2;
    } else {
      return 1;
    }
  }

  static double cardWidth(BuildContext context) {
    int count = cardsPerRow(context);
    double totalPadding = 32; // ListView horizontal padding
    return (MediaQuery.of(context).size.width - totalPadding) / count;
  }
}
