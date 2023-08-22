import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WarningDialog extends StatelessWidget {
  final String contentText;
  final String buttonText;
  final bool isSuccess;

  const WarningDialog({
    super.key,
    required this.contentText,
    required this.buttonText,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSuccess
              ? Lottie.asset(
                  'assets/animations/success_animation.json',
                  repeat: false,
                  width: 100,
                  height: 100,
                )
              : Lottie.asset(
                  'assets/animations/error_animation.json',
                  repeat: false,
                  // width: 100,
                  // height: 100,
                ),
          const SizedBox(height: 15),
          Text(
            contentText,
            textAlign: TextAlign.center,
          ),
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
