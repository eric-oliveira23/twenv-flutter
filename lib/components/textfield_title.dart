import 'package:flutter/material.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String title;

  const TextFieldWithTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 5),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.05),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.15),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
