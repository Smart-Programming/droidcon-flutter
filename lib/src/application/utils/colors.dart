import 'package:flutter/material.dart';

class Styles {
  static Color buttonColor = const Color(0xFF766A44);
  static Color containerColor = const Color(0xFF766A44);
  static Color textColor = const Color(0xFFFFFFFF);
  static Color subTextColor = const Color(0xFF766A44);
}

fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
