import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WarningDialog extends StatelessWidget {
  final String contentText;
  final String buttonText;

  const WarningDialog({
    super.key,
    required this.contentText,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/animations/success_animation.json',
            repeat: false,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 15),
          Text(contentText),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(buttonText),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
