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
          opacity: .3,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black12,
            Colors.black,
          ],
        ),
      ),
    );
  }
}
