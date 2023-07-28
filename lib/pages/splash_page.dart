import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:twenv/pages/register_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _nextPage(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Animate(
              effects: const [
                FadeEffect(),
                SlideEffect(
                    begin: Offset(5, 0),
                    duration: Duration(milliseconds: 1),
                    curve: Curves.decelerate)
              ],
              child: const Text(
                'T',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 200,
                ),
              ),
            ),
            Animate(
              effects: const [
                FadeEffect(),
                SlideEffect(
                  begin: Offset(5, 0),
                  duration: Duration(seconds: 1),
                  curve: Curves.decelerate,
                )
              ],
              child: const Text(
                '.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _nextPage(BuildContext context) {
  Future.delayed(
    const Duration(milliseconds: 1500),
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const RegisterPage(),
        ),
      );
    },
  );
}
