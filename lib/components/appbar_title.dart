import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Twenv.',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23,
        color: Colors.white,
      ),
    );
  }
}
