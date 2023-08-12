import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  VoidCallback onPressed;

  MyButton(
      {super.key,
      required this.title,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
