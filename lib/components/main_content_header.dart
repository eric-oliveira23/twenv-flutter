import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/colors.dart';

class MainContentContainer extends StatelessWidget {
  final Widget child;
  final bool enableMenu;

  const MainContentContainer({
    super.key,
    required this.child,
    required this.enableMenu,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Animate(
              effects: [
                ShimmerEffect(
                  color: Colors.white.withOpacity(0.07),
                  duration: const Duration(seconds: 2),
                ),
              ],
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 17,
                    left: 17,
                    right: 17,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
