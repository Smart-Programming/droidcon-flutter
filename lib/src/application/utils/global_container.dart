import 'package:droidcon_flutter/src/application/utils/colors.dart';
import 'package:flutter/material.dart';

class GlobalContainer extends StatelessWidget {
  const GlobalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/landing.jpg'),
              fit: BoxFit.cover,
              opacity: .3)),
    );
  }
}
