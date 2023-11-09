// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class UtilityClass {
  static InputDecoration textFormDecoration(
      BuildContext context, String labelText, IconData prefixIcon) {
    final InputDecoration decoration = InputDecoration(
      prefixIcon: Icon(
        prefixIcon,
        size: 18,
        color: Colors.black,
      ),
      iconColor: Colors.black,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 12),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        gapPadding: 10,
        borderSide: BorderSide(
          color: Colors.black.withOpacity(.2),
          width: 2.0,
        ),
      ),
    );

    return decoration;
  }
}
