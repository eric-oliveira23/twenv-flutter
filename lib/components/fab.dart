import 'package:flutter/material.dart';

import '../theme/colors.dart';

class FabMain extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;

  const FabMain({
    super.key,
    required this.onTap, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.purple5200.withOpacity(0.5),
      shape: const CircleBorder(
        side: BorderSide(color: AppColors.purple5200),
      ),
      child: icon,
      onPressed: () => onTap(),
    );
  }
}
